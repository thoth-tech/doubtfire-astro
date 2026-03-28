# Script: Planner_pull.ps1
# Description: Pulls tasks from a Microsoft Planner plan and exports them to a CSV, JSON, or Markdown file.
# Version: 3.3
# Author: Ibitope Fatoki

[CmdletBinding()]
param (
    [string]$ConfigPath = ".\config.json"
)

# --- Script-level configuration ---
# Set logging level. Options: DEBUG, INFO, WARN, ERROR
$Script:LogLevel = 'INFO'

# --- Function Definitions ---

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO",
        [string]$LogPath = ".\logs\script.log"
    )

    $logLevels = @{
        'DEBUG' = 1
        'INFO'  = 2
        'WARN'  = 3
        'ERROR' = 4
    }

    if ($logLevels[$Level.ToUpper()] -ge $logLevels[$Script:LogLevel.ToUpper()]) {
        try {
            $logDirectory = Split-Path -Path $LogPath -Parent
            if (-not (Test-Path -Path $logDirectory -PathType Container)) {
                New-Item -Path $logDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
            }
            $logEntry = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') [$($Level.ToUpper())] $Message"
            Add-Content -Path $LogPath -Value $logEntry
        }
        catch {
            Write-Warning "Could not write to log file at '$LogPath'. Error: $_"
        }
    }
}

function Select-TableColumns {
    param($Data)
    Write-Log -Level DEBUG -Message "Entering Select-TableColumns function."

    if (-not $Data) {
        Write-Log -Level WARN -Message "Select-TableColumns called with no data."
        return $null
    }

    $availableColumns = $Data[0].PSObject.Properties.Name
    Write-Log -Level DEBUG -Message "Available columns for selection: $($availableColumns -join ', ')"
    Write-Host "`nSelect the columns to include in the Markdown report:"
    for ($i = 0; $i -lt $availableColumns.Count; $i++) {
        Write-Host ("{0}. {1}" -f ($i + 1), $availableColumns[$i])
    }

    $choice = Read-Host -Prompt "Enter the column numbers, separated by commas (e.g., 1,3,4), or press Enter for all"
    Write-Log -Level INFO -Message "User column selection: '$choice'"

    if ([string]::IsNullOrWhiteSpace($choice)) {
        Write-Log -Level DEBUG -Message "User selected all columns."
        return $availableColumns
    }

    $selectedColumns = @()
    $choices = $choice -split ',' | ForEach-Object { $_.Trim() }

    foreach ($c in $choices) {
        if ($c -match "^\d+$" -and [int]$c -ge 1 -and [int]$c -le $availableColumns.Count) {
            $selectedIndex = [int]$c - 1
            if ($selectedColumns -notcontains $availableColumns[$selectedIndex]) {
                $selectedColumns += $availableColumns[$selectedIndex]
            }
        } else {
            Write-Log -Level WARN -Message "Invalid column selection: '$c'. Aborting export."
            Write-Host "Invalid selection: '$c'. Aborting export."
            return $null
        }
    }

    Write-Log -Level DEBUG -Message "Returning selected columns: $($selectedColumns -join ', ')"
    return $selectedColumns
}

function ConvertTo-MarkdownTable {
    param ($Data)
    Write-Log -Level DEBUG -Message "Entering ConvertTo-MarkdownTable function."

    if (-not $Data) {
        Write-Log -Level WARN -Message "ConvertTo-MarkdownTable called with no data."
        return ""
    }

    $headers = $Data[0].PSObject.Properties.Name
    $headerLine = "| $($headers -join ' | ') |"
    $separatorArray = $headers | ForEach-Object { '-' * $_.Length }
    $separatorLine = "| $($separatorArray -join ' | ') |"

    $dataRows = $Data | ForEach-Object {
        $row = $_
        $values = $headers | ForEach-Object {
            $value = $row.$_
            if ($null -eq $value) {
                $value = ""
            }
            $sanitizedValue = $value.ToString() -replace '(\r|\n)', ' ' -replace '\|', '&#124;'
            $sanitizedValue
        }
        "| $($values -join ' | ') |"
    }

    # Flatten the array of lines before joining to prevent nested array issues.
    $allLines = @($headerLine, $separatorLine) + $dataRows
    $markdown = $allLines -join [System.Environment]::NewLine

    Write-Log -Level DEBUG -Message "Exiting ConvertTo-MarkdownTable function. Markdown length: $($markdown.Length)"
    return $markdown
}

function Connect-ToGraph {
    Write-Log -Level DEBUG -Message "Entering Connect-ToGraph function."
    Write-Host "Importing Required Microsoft.Graph sub modules..."
    try {
        Import-Module Microsoft.Graph.Authentication -ErrorAction Stop
        Import-Module Microsoft.Graph.Planner -ErrorAction Stop
        Import-Module Microsoft.Graph.Users -ErrorAction Stop
    }
    catch {
        Write-Log -Level "ERROR" -Message "Failed to import required modules: $_"
        Write-Error "Failed to import required modules. Please ensure Microsoft.Graph is installed correctly and is up to date."
        exit 1
    }

    Write-Host "Authenticating to Microsoft Graph..."
    try {
        $context = Get-MgContext
        if ($context -and $context.AuthContext) {
            try {
                # Actively test the token to ensure it's valid, as cached tokens can become stale.
                Write-Log -Level DEBUG -Message "Existing context found. Verifying token with a test call..."
                Get-MgUser -UserId "me" -Property "Id" -ErrorAction Stop | Out-Null
                
                $tokenExpiry = [datetime]$context.AuthContext.ExpiresOn
                $timeToExpiry = $tokenExpiry - (Get-Date)

                if ($timeToExpiry.TotalMinutes -gt 5) {
                    Write-Log -Level INFO -Message "Already authenticated as $($context.Account). Token is valid."
                    Write-Host "Already authenticated as $($context.Account)"
                    return $true
                }
                else {
                    Write-Log -Level WARN -Message "Token is expired or expiring soon. Re-authenticating."
                    Write-Host "Your session is expired or expiring soon. Re-authenticating..."
                    Disconnect-MgGraph
                }
            }
            catch {
                Write-Log -Level WARN -Message "Token validation failed or session is invalid. Re-authenticating. Error: $_"
                Disconnect-MgGraph
            }
        }

        Connect-MgGraph -Scopes @("Tasks.Read", "Tasks.ReadWrite", "User.Read", "User.ReadBasic.All") -Audience "organizations"
        $context = Get-MgContext
        if (-not $context) {
            throw "Failed to establish connection"
        }
        Write-Host "Authentication successful as $($context.Account)"
        Write-Log -Level INFO -Message "Authentication successful as $($context.Account)"
        return $true
    }
    catch {
        Write-Log -Level "ERROR" -Message "Authentication failed: $_"
        Write-Error "Authentication failed: $_"
        exit 1
    }
}

function Get-Configurations {
    param ([string]$Path)
    Write-Log -Level DEBUG -Message "Entering Get-Configurations function for path: $Path"
    if (Test-Path $Path) {
        try {
            $content = Get-Content -Path $Path -Raw
            if ([string]::IsNullOrWhiteSpace($content)) {
                Write-Log -Level INFO -Message "Config file is empty. Returning empty array."
                return @()
            }
            $data = $content | ConvertFrom-Json
            Write-Log -Level DEBUG -Message "Successfully read and parsed config file."
            return @($data)
        }
        catch {
            Write-Log -Level "ERROR" -Message "Failed to read or parse config file '$Path': $_"
            Write-Error "Could not read or parse config file '$Path'. It might be corrupted."
            return @()
        }
    }
    Write-Log -Level INFO -Message "Config file not found at '$Path'. Returning empty array."
    return @()
}

function Save-Configurations {
    param ([string]$Path, $ConfigData)
    Write-Log -Level DEBUG -Message "Entering Save-Configurations function for path: $Path"
    try {
        $jsonOutput = if ($ConfigData -is [array] -and $ConfigData.Count -eq 1) {
            Write-Log -Level DEBUG -Message "Saving single-item array with comma-prefix for backwards compatibility."
            ,$ConfigData | ConvertTo-Json -Depth 5
        } else {
            Write-Log -Level DEBUG -Message "Saving multi-item array or empty array."
            $ConfigData | ConvertTo-Json -Depth 5
        }
        $jsonOutput | Set-Content -Path $Path
        Write-Log -Level INFO -Message "Successfully saved configuration to '$Path'."
    }
    catch {
        $errorMessage = $_.Exception.Message
        Write-Log -Level "ERROR" -Message "Failed to save config file '$Path': $errorMessage"
        Write-Error "Failed to save configuration to '$Path'. Reason: $errorMessage"
    }
}

function Set-Configurations {
    param ([string]$ConfigPath)
    Write-Log -Level INFO -Message "Entering plan management utility."

    while ($true) {
        [array]$savedPlans = Get-Configurations -Path $ConfigPath

        Write-Host "`n--- Manage Saved Plans ---"
        if ($savedPlans.Count -eq 0) {
            Write-Host "No saved plans found."
        } else {
            for ($i = 0; $i -lt $savedPlans.Count; $i++) {
                Write-Host ("{0}. {1} ({2})" -f ($i + 1), $savedPlans[$i].name, $savedPlans[$i].planId)
            }
        }

        Write-Host "--------------------------"
        Write-Host "A. Add a new plan"
        Write-Host "D. Delete a plan"
        Write-Host "Q. Quit to main menu"

        $choice = Read-Host -Prompt "Enter your choice"
        Write-Log -Level INFO -Message "User selected management option: '$choice'"

        switch ($choice.ToUpper()) {
            'A' {
                Write-Host "`nNeed help finding the id? Look no further https://youtu.be/KdOdRppqxCk"
                $newPlanId = Read-Host -Prompt "Please enter the new Plan ID"
                $planName = Read-Host -Prompt "Please enter a name for this plan"

                if (-not $newPlanId -or -not $planName) {
                    Write-Log -Level WARN -Message "User tried to add a plan with empty ID or name."
                    Write-Host "Plan ID and Plan Name cannot be empty."
                    continue
                }
                Write-Log -Level INFO -Message "Adding new plan: Name='$planName', ID='$newPlanId'"
                $newPlan = @{ planId = $newPlanId; name = $planName }
                $savedPlans += $newPlan
                Save-Configurations -Path $ConfigPath -ConfigData $savedPlans
                Write-Host "Plan '$planName' added successfully."
            }
            'D' {
                if ($savedPlans.Count -eq 0) {
                    Write-Host "No plans to delete."
                    continue
                }

                Write-Host "`nWhich plan would you like to delete?"
                for ($i = 0; $i -lt $savedPlans.Count; $i++) {
                    Write-Host ("{0}. {1}" -f ($i + 1), $savedPlans[$i].name)
                }

                $delChoice = Read-Host -Prompt "Enter the number of the plan to delete"
                if ($delChoice -match "^\d+$" -and [int]$delChoice -ge 1 -and [int]$delChoice -le $savedPlans.Count) {
                    $selectedIndex = [int]$delChoice - 1
                    $planNameToDelete = $savedPlans[$selectedIndex].name
                    Write-Log -Level INFO -Message "User chose to delete plan #$delChoice ('$planNameToDelete')."
                    $confirmation = Read-Host "Are you sure you want to delete '$planNameToDelete'? (y/n)"
                    if ($confirmation.ToUpper() -eq 'Y') {
                        Write-Log -Level INFO -Message "User confirmed deletion."
                        $savedPlans = $savedPlans | Where-Object { $_.planId -ne $savedPlans[$selectedIndex].planId }
                        Save-Configurations -Path $ConfigPath -ConfigData $savedPlans
                        Write-Host "'$planNameToDelete' has been deleted."
                    } else {
                        Write-Log -Level INFO -Message "User cancelled deletion."
                    }
                } else {
                    Write-Log -Level WARN -Message "User entered invalid number for deletion: '$delChoice'"
                    Write-Host "Invalid number."
                }
            }
            'Q' {
                Write-Log -Level INFO -Message "Exiting plan management utility."
                return
            }
            default {
                Write-Log -Level WARN -Message "User entered invalid management option: '$choice'"
                Write-Host "Invalid option."
            }
        }
    }
}

function Select-PlannerPlan {
    param ([string]$ConfigPath)
    Write-Log -Level DEBUG -Message "Entering Select-PlannerPlan function."
    [array]$savedPlans = Get-Configurations -Path $ConfigPath
    $planId = $null

    if ($savedPlans.Count -gt 0) {
        Write-Host "Please choose a saved Plan or enter a new one:"
        Write-Host "`nNeed help finding the id? Look no further https://youtu.be/KdOdRppqxCk"
        for ($i = 0; $i -lt $savedPlans.Count; $i++) {
            Write-Host ("{0}. {1}" -f ($i + 1), $savedPlans[$i].name)
        }
        Write-Host "N. Enter a new Plan"

        $choice = Read-Host -Prompt "Select a plan"
        Write-Log -Level INFO -Message "User plan selection: '$choice'"

        if ($choice -eq 'N' -or $choice -eq 'n') {
            $planId = $null
        }
        elseif ($choice -match "^\d+$" -and [int]$choice -ge 1 -and [int]$choice -le $savedPlans.Count) {
            $selectedIndex = [int]$choice - 1
            $planId = $savedPlans[$selectedIndex].planId
        }
        else {
            Write-Log -Level WARN -Message "Invalid plan selection. Exiting."
            Write-Host "Invalid selection. Exiting."
            exit
        }
    }

    if (-not $planId) {
        Write-Log -Level INFO -Message "User chose to enter a new plan."
        $newPlanId = Read-Host -Prompt "Please enter the new Plan ID"
        $planName = Read-Host -Prompt "Please enter a name for this plan (for your reference)"

        if (-not $newPlanId -or -not $planName) {
            Write-Log -Level WARN -Message "New plan details were empty. Exiting."
            Write-Host "Plan ID and Plan Name cannot be empty. Exiting."
            exit
        }

        $newPlan = @{ planId = $newPlanId; name = $planName }
        $savedPlans += $newPlan
        Save-Configurations -Path $ConfigPath -ConfigData $savedPlans
        Write-Host "New Plan saved: $planName"
        $planId = $newPlanId
    }

    Write-Log -Level INFO -Message "Using Plan ID: $planId"
    Write-Host "Using Plan ID: $planId"
    return $planId
}

function Select-PlannerBucket {
    param ([string]$PlanId)
    Write-Log -Level DEBUG -Message "Entering Select-PlannerBucket for Plan ID: $PlanId"
    Write-Host "Fetching buckets for plan..."
    try {
        $buckets = Get-MgPlannerPlanBucket -PlannerPlanId $PlanId -ErrorAction Stop
    }
    catch {
        Write-Log -Level "ERROR" -Message "Failed to get buckets for plan '$PlanId': $_"
        Write-Error "Failed to get buckets for plan '$PlanId': $_"
        return $null
    }

    if ($buckets.Count -eq 0) {
        Write-Log -Level WARN -Message "No buckets found in plan '$PlanId'."
        Write-Host "No buckets found in this plan."
        return $null
    }

    Write-Host "Please choose a bucket:"
    for ($i = 0; $i -lt $buckets.Count; $i++) {
        Write-Host ("{0}. {1}" -f ($i + 1), $buckets[$i].Name)
    }

    $choice = Read-Host -Prompt "Select a bucket"
    if ($choice -match "^\d+$" -and [int]$choice -ge 1 -and [int]$choice -le $buckets.Count) {
        $selectedIndex = [int]$choice - 1
        $selectedBucket = $buckets[$selectedIndex]
        Write-Log -Level INFO -Message "User selected bucket: Name='$($selectedBucket.Name)', ID='$($selectedBucket.Id)'"
        return $selectedBucket.Id
    }
    else {
        Write-Log -Level WARN -Message "User entered invalid bucket selection: '$choice'"
        Write-Host "Invalid selection. No bucket filter will be applied."
        return $null
    }
}

function Select-TaskStatus {
    Write-Log -Level DEBUG -Message "Entering Select-TaskStatus function."
    Write-Host "Filter by task status:"
    Write-Host "1. Not Started"
    Write-Host "2. In Progress"
    Write-Host "3. Completed"

    $choice = Read-Host -Prompt "Enter your choice"
    Write-Log -Level INFO -Message "User status filter selection: '$choice'"
    switch ($choice) {
        '1' { return "Not Started" }
        '2' { return "In Progress" }
        '3' { return "Completed" }
        default {
            Write-Log -Level WARN -Message "Invalid status selection."
            Write-Host "Invalid selection. No status filter will be applied."
            return $null
        }
    }
}

function Get-TaskReferences {
    param ($TaskDetails)
    Write-Log -Level DEBUG -Message "Entering Get-TaskReferences function."

    if (-not $TaskDetails.References -or -not $TaskDetails.References.AdditionalProperties) {
        return "No references"
    }

    $foundUrls = @()
    foreach ($key in $TaskDetails.References.AdditionalProperties.Keys) {
        $url = [System.Net.WebUtility]::UrlDecode($key)
        $alias = $TaskDetails.References.AdditionalProperties[$key].alias

        $urlIsGithub = $url -like "*github.com*"
        $aliasIsGithub = $alias -like "*github.com*"

        if ($urlIsGithub -and $aliasIsGithub) {
            if ($url -eq $alias) { $foundUrls += $url } else { $foundUrls += "$alias ($url)" }
        } elseif ($urlIsGithub) {
            $foundUrls += $url
        } elseif ($aliasIsGithub) {
            $foundUrls += $alias
        }
    }

    if ($foundUrls.Count -gt 0) {
        $result = $foundUrls -join "; "
        Write-Log -Level DEBUG -Message "Found $($foundUrls.Count) GitHub links."
        return $result
    } else {
        return "" # No GitHub links found
    }
}

function Get-PlannerTasks {
    param (
        [string]$PlanId,
        [string]$Selection,
        $StartDate,
        $EndDate,
        [string]$BucketId,
        [string]$Status
    )
    Write-Log -Level INFO -Message "Starting Get-PlannerTasks for Plan ID '$PlanId'. Selection: $Selection, BucketId: $BucketId, Status: $Status"

    Write-Host "Fetching tasks from plan..."
    try {
        $allTasks = Get-MgPlannerPlanTask -PlannerPlanId $PlanId -ErrorAction Stop
        if (-not $allTasks) {
            Write-Log -Level WARN -Message "No tasks found in the plan."
            Write-Warning "No tasks found in the plan."
            return @()
        }
        Write-Log -Level INFO -Message "Fetched $($allTasks.Count) total tasks from plan."

        $tasksToProcess = $allTasks
        if ($BucketId) {
            $tasksToProcess = $tasksToProcess | Where-Object { $_.BucketId -eq $BucketId }
            Write-Log -Level INFO -Message "Filtered by Bucket ID '$BucketId'. $($tasksToProcess.Count) tasks remain."
        }
        if ($Status) {
            switch ($Status) {
                "Not Started" { $tasksToProcess = $tasksToProcess | Where-Object { $_.PercentComplete -eq 0 } }
                "In Progress" { $tasksToProcess = $tasksToProcess | Where-Object { $_.PercentComplete -gt 0 -and $_.PercentComplete -lt 100 } }
                "Completed"   { $tasksToProcess = $tasksToProcess | Where-Object { $_.PercentComplete -eq 100 } }
            }
            Write-Log -Level INFO -Message "Filtered by Status '$Status'. $($tasksToProcess.Count) tasks remain."
        }

        if ($tasksToProcess.Count -eq 0) {
            Write-Log -Level WARN -Message "No tasks match the specified filter criteria."
            Write-Warning "No tasks match the specified filter criteria."
            return @()
        }

        $buckets = Get-MgPlannerPlanBucket -PlannerPlanId $PlanId -ErrorAction Stop
        $bucketNameLookup = @{}
        foreach ($bucket in $buckets) { $bucketNameLookup[$bucket.Id] = $bucket.Name }
        Write-Log -Level DEBUG -Message "Created lookup for $($buckets.Count) buckets."
    }
    catch {
        $errorMessage = $_.Exception.Message
        Write-Log -Level "ERROR" -Message "Failed to get tasks or buckets for plan '$PlanId': $errorMessage"
        if ($errorMessage -like "*DeviceCodeCredential*") {
            Write-Error "An authentication error occurred while fetching data. This can sometimes be resolved by restarting the script to force re-authentication. Error: $errorMessage"
        }
        else {
            Write-Error "Failed to get tasks or buckets: $errorMessage"
        }
        exit 1
    }

    $totalTasks = $tasksToProcess.Count
    $processedCount = 0

    $taskData = foreach ($task in $tasksToProcess) {
        $processedCount++
        Write-Progress -Activity "Processing Tasks" -Status "Task $processedCount of $totalTasks" -PercentComplete (($processedCount / $totalTasks) * 100)
        Write-Log -Level DEBUG -Message "Processing task: ID=$($task.Id), Title='$($task.Title)'"

        $bucketName = $bucketNameLookup[$task.BucketId]

        try {
            if (-not $task.Assignments) {
                if ($selection -eq '1') {
                    $taskDetails = Get-MgPlannerTaskDetail -PlannerTaskId $task.Id
                    $attachments = Get-TaskReferences -TaskDetails $taskDetails

                    [PSCustomObject]@{ Name = "Unassigned"; Role = ""; Task = $task.Title; Bucket = $bucketName; Attachments = $attachments; Status = switch ($task.PercentComplete) { 0 { "Not Started" } 100 { "Completed" } default { "In Progress" } } }
                }
                continue
            }

            $taskDetails = Get-MgPlannerTaskDetail -PlannerTaskId $task.Id
            $attachments = Get-TaskReferences -TaskDetails $taskDetails

            $assignmentKeys = $task.Assignments.AdditionalProperties.Keys
            $assignments = $task.Assignments.AdditionalProperties

            if ($assignmentKeys.Count -gt 0) {
                $sortedKeys = $assignmentKeys | Sort-Object { [datetime]$assignments[$_].assignedDateTime }
                $mainContributorKey = $sortedKeys[0]
                $reviewerKey = if ($sortedKeys.Count -gt 1) { $sortedKeys[-1] } else { $null }

                foreach ($userId in $assignmentKeys) {
                    $assignment = $assignments[$userId]
                    $assignedDateTime = [datetime]$assignment.assignedDateTime

                    if ($selection -eq '3' -and ($assignedDateTime -lt $StartDate -or $assignedDateTime -ge $EndDate)) {
                        Write-Log -Level DEBUG -Message "Skipping user '$userId' in task '$($task.Title)' due to date filter."
                        continue
                    }

                    $role = if ($userId -eq $mainContributorKey) { "Main Contributor" } elseif ($userId -eq $reviewerKey) { "Reviewer" } else { "" }

                    try {
                        $user = Get-MgUser -UserId $userId -ErrorAction Stop
                        $userName = $user.DisplayName
                    }
                    catch {
                        Write-Log -Level "WARN" -Message "Could not get user details for ID '$userId': $_"
                        $userName = "$userId (Unable to get name)"
                    }

                    [PSCustomObject]@{ Name = $userName; Role = $role; Task = $task.Title; Bucket = $bucketName; Attachments = $attachments; Status = switch ($task.PercentComplete) { 0 { "Not Started" } 100 { "Completed" } default { "In Progress" } } }
                }
            }
        }
        catch {
            Write-Log -Level "WARN" -Message "Failed to process task '$($task.Title)' (ID: $($task.Id)). Error: $_"
            Write-Warning "Failed to process task: $($task.Title). Error: $_"
            [PSCustomObject]@{ Name = "Error Processing"; Role = ""; Task = $task.Title; Bucket = $bucketName; Attachments = "Error retrieving details"; Status = "Unknown" }
        }
    }
    Write-Progress -Activity "Processing Tasks" -Completed
    Write-Log -Level INFO -Message "Finished processing tasks. Returning $($taskData.Count) records."
    return $taskData
}

function Export-Data {
    param ($TaskData)
    Write-Log -Level DEBUG -Message "Entering Export-Data function."

    if (-not $TaskData) {
        Write-Log -Level WARN -Message "No data passed to Export-Data."
        Write-Host "No data to export."
        return
    }

    $sortedData = $TaskData | Sort-Object Name

    Write-Host "`nPreview of exported data:"
    $previewColumns = @('Name', 'Task', 'Bucket', 'Status')
    $sortedData | Format-Table -Property $previewColumns -AutoSize

    $formatChoice = Read-Host -Prompt "Choose export format: (1) CSV, (2) JSON, or (3) Markdown"
    Write-Log -Level INFO -Message "User chose export format: $formatChoice"

    # --- Column Selection for applicable formats ---
    $reportData = $sortedData
    if ($formatChoice -eq '1' -or $formatChoice -eq '3') { # CSV or Markdown
        $formatName = if ($formatChoice -eq '1') { "CSV" } else { "Markdown" }
        $selectedColumns = Select-TableColumns -Data $sortedData -FormatName $formatName
        if (-not $selectedColumns) {
            Write-Log -Level WARN -Message "User cancelled or failed column selection. Aborting export."
            return
        }

        if ($selectedColumns.Count -ne $sortedData[0].PSObject.Properties.Name.Count) {
            $reportData = $sortedData | Select-Object -Property $selectedColumns
            Write-Log -Level INFO -Message "User filtered columns for export: $($selectedColumns -join ', ')"
        }
    }

    # --- File Export Logic ---
    switch ($formatChoice) {
        '1' { # CSV
            $outputFile = Read-Host -Prompt "Enter the desired name for the CSV file"
            if (-not ($outputFile.EndsWith(".csv"))) { $outputFile = "$outputFile.csv" }
            Write-Log -Level INFO -Message "Exporting to CSV at '$outputFile'"
            try {
                $reportData | Export-Csv -Path $outputFile -NoTypeInformation -Force
                Write-Host "Tasks exported successfully to $outputFile"
            }
            catch {
                Write-Log -Level "ERROR" -Message "Failed to export CSV to '$outputFile': $_"
                Write-Error "Failed to export CSV file: $_"
            }
        }
        '2' { # JSON
            $outputFile = Read-Host -Prompt "Enter the desired name for the JSON file"
            if (-not ($outputFile.EndsWith(".json"))) { $outputFile = "$outputFile.json" }
            Write-Log -Level INFO -Message "Exporting to JSON at '$outputFile'"
            try {
                $reportData | ConvertTo-Json -Depth 10 | Set-Content -Path $outputFile
                Write-Host "Tasks exported successfully to $outputFile"
            }
            catch {
                Write-Log -Level "ERROR" -Message "Failed to export JSON to '$outputFile': $_"
                Write-Error "Failed to export JSON file: $_"
            }
        }
        '3' { # Markdown
            $outputFile = Read-Host -Prompt "Enter the desired name for the MD file"
            if (-not ($outputFile.EndsWith(".md"))) { $outputFile = "$outputFile.md" }
            Write-Log -Level INFO -Message "Exporting to Markdown at '$outputFile'"
            try {
                $markdownTable = ConvertTo-MarkdownTable -Data $reportData
                Set-Content -Path $outputFile -Value $markdownTable
                Write-Host "Tasks exported successfully to $outputFile"

                $convertChoice = Read-Host -Prompt "Convert GitHub PR links to clickable Markdown hyperlinks? (y/n)"
                if ($convertChoice.ToUpper() -eq 'Y') {
                    Convert-GitHubLinksToMarkdown -Path $outputFile
                    Write-Host "GitHub links have been converted in $outputFile"
                }
            }
            catch {
                Write-Log -Level "ERROR" -Message "Failed to export Markdown to '$outputFile': $_"
                Write-Error "Failed to export Markdown file: $_"
            }
        }
        default {
            Write-Log -Level WARN -Message "User entered invalid export format: $formatChoice"
            Write-Host "Invalid format selection. Export cancelled."
        }
    }
}

function Convert-GitHubLinksToMarkdown {
    param (
        [string]$Path
    )
    Write-Log -Level INFO -Message "Starting GitHub link conversion for '$Path'."
    try {
        $content = Get-Content -Path $Path -Raw
        
        # Regex to find GitHub pull request URLs.
        # It captures the whole URL and then the PR number.
        $regex = '(https?://github\.com/[^/|]+/[^/|]+/pull/(\d+)[^|; ]*)'
        
        $newContent = $content
        $foundMatches = $content | Select-String -Pattern $regex -AllMatches
        
        if ($foundMatches) {
            # Get unique matches to avoid processing the same URL multiple times
            $uniqueMatches = $foundMatches.Matches | Select-Object -Property Value, @{N='PR';E={$_.Groups[2].Value}} -Unique
            
            foreach ($match in $uniqueMatches) {
                $url = $match.Value
                $pr = $match.PR
                $markdownLink = "[PR#$pr]($url)"
                # Use simple string replacement.
                $newContent = $newContent.Replace($url, $markdownLink)
            }
        }
        
        $newContent | Set-Content -Path $Path
        Write-Log -Level INFO -Message "Finished GitHub link conversion for '$Path'."
    }
    catch {
        Write-Log -Level "ERROR" -Message "Failed to convert GitHub links in '$Path'. Error: $_"
        Write-Error "An error occurred during link conversion: $_"
    }
}

function Convert-CsvToMarkdown {
    Write-Log -Level INFO -Message "Entering CSV to Markdown conversion utility."
    
    $csvPath = $null # Initialize to null

    # Find CSV files in the script's directory ($PSScriptRoot is an automatic variable)
    $localCsvFiles = Get-ChildItem -Path $PSScriptRoot -Filter *.csv

    if ($localCsvFiles.Count -gt 0) {
        Write-Host "`nFound CSV files in the current directory:"
        for ($i = 0; $i -lt $localCsvFiles.Count; $i++) {
            Write-Host ("{0}. {1}" -f ($i + 1), $localCsvFiles[$i].Name)
        }
        Write-Host "M. Enter a file path manually"
        
        $choice = Read-Host -Prompt "Select a file or choose manual entry"
        
        if ($choice -match "^\d+$" -and [int]$choice -ge 1 -and [int]$choice -le $localCsvFiles.Count) {
            $selectedIndex = [int]$choice - 1
            $csvPath = $localCsvFiles[$selectedIndex].FullName
            Write-Log -Level INFO -Message "User selected local CSV file: $csvPath"
        }
        elseif ($choice.ToUpper() -ne 'M') {
            Write-Host "Invalid selection. Returning to main menu."
            Write-Log -Level WARN -Message "User made an invalid selection: $choice"
            return
        }
        # If choice is 'M', $csvPath remains null and we fall through to the manual prompt.
    }

    # If no local files were found, or if user chose manual entry
    if (-not $csvPath) {
        $csvPath = Read-Host -Prompt "Please enter the path to the input CSV file"
    }

    # Validate the final path
    if (-not (Test-Path -Path $csvPath) -or -not ($csvPath.EndsWith(".csv"))) {
        Write-Log -Level WARN -Message "Invalid CSV path provided: $csvPath"
        Write-Host "Error: The specified file does not exist or is not a .csv file."
        return
    }

    $markdownPath = Read-Host -Prompt "Please enter the name for the output Markdown file"
    if (-not ($markdownPath.EndsWith(".md"))) {
        $markdownPath = "$markdownPath.md"
    }

    try {
        $csvData = Import-Csv -Path $csvPath
        
        if (-not $csvData) {
            Write-Log -Level WARN -Message "CSV file '$csvPath' is empty or could not be read."
            Write-Host "Warning: CSV file is empty or could not be read. No output generated."
            return
        }

        $markdownTable = ConvertTo-MarkdownTable -Data $csvData
        Set-Content -Path $markdownPath -Value $markdownTable
        Write-Log -Level INFO -Message "Successfully converted '$csvPath' to '$markdownPath'."
        Write-Host "Successfully converted CSV to Markdown: $markdownPath"

        # Offer to convert GitHub links
        $convertChoice = Read-Host -Prompt "Convert GitHub PR links to clickable Markdown hyperlinks? (y/n)"
        if ($convertChoice.ToUpper() -eq 'Y') {
            Convert-GitHubLinksToMarkdown -Path $markdownPath
            Write-Host "GitHub links have been converted in $markdownPath"
        }
    }
    catch {
        Write-Log -Level "ERROR" -Message "Failed to convert CSV '$csvPath' to Markdown. Error: $_"
        Write-Error "An error occurred during CSV to Markdown conversion: $_"
    }
}

# --- Main Script ---

# --- Pre-flight Checks ---

# Check for PowerShell 7+
if ($PSVersionTable.PSVersion.Major -lt 7) {
    Write-Error "This script requires PowerShell 7 or higher. You are running version $($PSVersionTable.PSVersion). Please start the script using PowerShell 7 (pwsh.exe)."
    if ($Host.Name -eq "ConsoleHost") {
        Read-Host "Press Enter to exit"
    }
    exit 1
}

# Check for module dependency
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Write-Host "Microsoft.Graph module is not installed. Please install it by running: Install-Module Microsoft.Graph -Scope CurrentUser -AllowClobber -Force"
    exit
}

#clear the previous connection for better reliability
Disconnect-MgGraph

Write-Log -Message "Script started."

while ($true) {
    Write-Host "`n--- Microsoft Planner Task Exporter ---"
    Write-Host "1. Pull all tasks (including unassigned)"
    Write-Host "2. Pull only tasks with assigned users"
    Write-Host "3. Pull tasks of assigned users based on a date range"
    Write-Host "4. Pull tasks from a specific bucket"
    Write-Host "5. Pull tasks by completion status"
    Write-Host "6. Manage saved plans"
    Write-Host "7. Convert CSV to Markdown"
    Write-Host "Q. Quit"
    $selection = Read-Host -Prompt "Enter your choice"

    if ($selection.ToUpper() -eq 'Q') {
        break
    }

    # Handle standalone options first
    if ($selection -eq '7') {
        Convert-CsvToMarkdown
        Read-Host "Press Enter to return to the main menu"
        continue
    }

    if ($selection -notin '1', '2', '3', '4', '5', '6', '7') {
        Write-Log -Level WARN -Message "User selected invalid main menu option: $selection"
        Write-Host "Invalid selection."
        continue
    }

    # The rest of the options require Graph connection
    Connect-ToGraph

    if ($selection -eq '6') {
        Set-Configurations -ConfigPath $ConfigPath
        continue
    }

    # The rest of the options require a Plan ID
    $planId = Select-PlannerPlan -ConfigPath $ConfigPath
    if (-not $planId) { continue }

    $startDate = $null
    $endDate = $null
    $bucketId = $null
    $status = $null

    if ($selection -eq '3') {
        try {
            $startDateStr = Read-Host -Prompt "Enter the start date (YYYY-MM-DD)"
            $startDate = [datetime]::ParseExact($startDateStr, 'yyyy-MM-dd', $null)
            $endDateStr = Read-Host -Prompt "Enter the end date (YYYY-MM-DD)"
            $endDate = [datetime]::ParseExact($endDateStr, 'yyyy-MM-dd', $null).AddDays(1)
            Write-Log -Level INFO -Message "Date filter selected. Start: $startDate, End: $endDate"
        }
        catch {
            Write-Log -Level WARN -Message "User entered invalid date format $startDateStr and $endDateStr."
            Write-Host "Invalid date format. Please use YYYY-MM-DD."
            continue
        }
    }
    elseif ($selection -eq '4') {
        $bucketId = Select-PlannerBucket -PlanId $planId
    }
    elseif ($selection -eq '5') {
        $status = Select-TaskStatus
    }

    $taskData = Get-PlannerTasks -PlanId $planId -Selection $selection -StartDate $startDate -EndDate $endDate -BucketId $bucketId -Status $status
    Export-Data -TaskData $taskData

    Read-Host "Press Enter to return to the main menu"
}
Write-Log -Message "Script finished."
Write-Host "Script made by Ibitope Fatoki. Github ibi420."
Write-Host "Exiting."
