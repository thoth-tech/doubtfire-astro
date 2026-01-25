---
title: Planner Task Puller Script Documentation
---

## Overview

This PowerShell script connects to Microsoft Graph to retrieve tasks from a specified Microsoft Planner plan. It is a flexible, menu-driven tool that allows for powerful filtering and multiple export formats.

The script can store connection details for multiple plans in a `config.json` file, allowing for easy switching between them. It fetches task details, including bucket names, completion status, attachments (specifically looking for GitHub links), and assigned users with their roles (Main Contributor, Reviewer). The collected data can then be exported to a **CSV**, **JSON**, or **Markdown** file.

For CSV and Markdown exports, the script allows you to interactively select which data columns to include, making it ideal for generating custom reports.

## Key Features

* **Multiple Filtering Options:** Pull tasks by assignment, date range, completion status, or specific bucket.
* **Multiple Export Formats:** Export your data to CSV, JSON, or a report-ready Markdown table.
* **CSV to Markdown Utility:** A dedicated tool to convert existing CSV files into Markdown tables, with an easy-to-use file picker for local files.
* **Automatic Link Conversion:** For Markdown exports, automatically convert raw GitHub pull request URLs into formatted, clickable Markdown hyperlinks.
* **Customizable Columns:** For CSV and Markdown exports, you can choose exactly which columns to include.
* **Plan Management:** An interactive utility to add, delete, and view your saved Planner plans.
* **Robust Logging:** Creates a detailed log file in the `./logs` directory, with a configurable log level for easier debugging.
* **Environment Checks:** Automatically checks for the required PowerShell version (7+) and `Microsoft.Graph` module to prevent errors.

## Prerequisites

* **PowerShell 7 or higher.** The script will not run on older versions like Windows PowerShell 5.1. You can get PowerShell 7 from the [Microsoft Page](https://learn.microsoft.com/en-gb/powershell/scripting/install/installing-powershell?view=powershell-7.5) or [GitHub](https://github.com/PowerShell/PowerShell).
* An internet connection.
* A Microsoft 365 account with access to Microsoft Planner.
* The `Microsoft.Graph` PowerShell module.

## Setup

Before running the script for the first time, you need to install the `Microsoft.Graph` module. Open a PowerShell 7 terminal and run the following command:

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser -AllowClobber -Force
```

## Finding Your Plan ID

The Plan ID is required to fetch tasks from a specific plan. You can find the Plan ID in the URL of your Planner board.

1. Go to [Microsoft Planner](https://tasks.office.com/).
2. Open the plan you want to use.
3. Look at the URL in your browser's address bar. It will look something like this:
   `https://tasks.office.com/your-tenant.com/en-US/Home/Plan?planId=YOUR_PLAN_ID&ownerId=...`
4. The `planId` is the alphanumeric string that follows `planId=`. Copy this value.

### Video Tutorial

For a visual guide on how to find the Plan ID, please watch this video (covers two methods):

[Plan ID Tutorial](https://youtu.be/KdOdRppqxCk)
If you don't want to do that, here are the steps transcribed:

# How to Find Your Planner ID

This guide outlines two methods for finding your Planner ID, as described in the video "How to Find your Planner ID."

### Method 1: Scraping from the URL

This method is simpler but less reliable.

1. **Open your Planner:** Go to the specific plan in your web browser.
2. **Locate the ID:** Look at the address bar. The **Planner ID** is the string of characters right after `"plan/"`.
3. **Copy the ID:** This alphanumeric string is your Planner ID.

### Method 2: Using Microsoft Graph Explorer

This method is more reliable but more complex.

1. **Go to Graph Explorer:** Open `developer.microsoft.com/graph/graph-explorer` in your browser.

#### Option A: If you have a task assigned to the plan

1. In the left sidebar, scroll down and expand **Users**.
2. Find and click on **all my planner tasks**.
3. Click the **Run query** button.
4. In the response area, find **planId**. The value next to it is your Planner ID.

#### Option B: If you do not have a task assigned to the plan

**First, get the Group ID:**
1. In the left sidebar, scroll up to **Groups**.
2. Click on **all groups I belong to**.
3. Click **Run query**.
4. Use your browser's find function (Ctrl+F or Cmd+F) to search for the name of the group associated with your plan.
5. Locate the **id** field next to the group name. This is your **Group ID**. Copy it.

**Next, get the Planner ID using the Group ID:**
1. In the left sidebar, scroll down to **Planner**.
2. Click on **all Planner plans associated with a group**.
3. In the query bar, replace the placeholder with the Group ID you just copied.
4. Click **Run query**.
5. In the response, find the plan by its **title**. The **id** field associated with that title is your **Planner ID**.

## How to Run the Script

1. Open a **PowerShell 7** terminal (`pwsh.exe`).
2. Navigate to the directory where the script is located.
3. Execute the script by running: `.\Planner_pull.ps1`
4. Follow the on-screen prompts.

### Main Menu

The script presents a main menu with the following options:

* **1-5 (Data Pulling Options):** Choose how you want to filter the tasks you retrieve:
    1. Pull all tasks (including unassigned)
    2. Pull only tasks with assigned users
    3. Pull tasks of assigned users based on a date range
    4. Pull tasks from a specific bucket
    5. Pull tasks by completion status (Not Started, In Progress, Completed)
* **6. Manage saved plans:** Enter a utility menu to add or delete plans from your `config.json` file.
* **7. Convert CSV to Markdown:** A tool to convert a CSV file to a Markdown table.
* **Q. Quit:** Exit the script.

### Data Export Workflow

After you select a data pulling option (1-5) and retrieve the tasks:

1. **Data Preview:** A preview of the data is shown in the console.
2. **Choose Export Format:** You will be prompted to choose an export format: **CSV**, **JSON**, or **Markdown**.
3. **Select Columns (for CSV/Markdown):** If you choose CSV or Markdown, a menu will appear listing all available data columns. You can then enter the numbers of the columns you wish to keep in your report (e.g., `1,3,5`).
4. **Enter Filename:** Provide a name for the output file.
5. **Convert Links (for Markdown):** If you chose Markdown, you will be asked if you want to convert GitHub pull request links into clickable Markdown hyperlinks.

### CSV to Markdown Conversion

This utility provides a convenient way to create a Markdown report from a CSV file. This is useful if you prefer to export your data to CSV, make manual edits, and then generate a final Markdown table.

When you select this option from the main menu:

1.  **File Selection:** The script will first look for any `.csv` files in its current directory and display them as a numbered list. You can simply select a number to choose your file.
2.  **Manual Path:** If your file is in a different location, you can choose the option to enter the file path manually.
3.  **Output:** You will be prompted to provide a name for the new Markdown file.
4.  **Link Conversion:** After the Markdown file is created, the script will ask if you want to perform the final step of converting any GitHub URLs into clickable hyperlinks.

## How it Works

1. **Pre-flight Checks:** The script first checks for two things:
    * That it is being run in **PowerShell 7 or higher**.
    * That the `Microsoft.Graph` module is installed.
2. **User Selection:** It prompts the user to choose an action from the main menu. This can be a data pull, plan management, or a utility like the CSV to Markdown converter.
3. **Authentication:** For data pulling and plan management, it connects to the Microsoft Graph API using a device code authentication flow.
4. **Plan ID Configuration (`config.json`):**
    * The script reads the `config.json` file to find any saved plans. This file is created automatically.
    * If saved plans are found, it displays them in a menu for the user to select.
    * The **Manage saved plans** option provides a dedicated utility for adding and deleting plans from this file.
5. **Data Retrieval & Processing:**
    * It fetches tasks, buckets, and user details from the Graph API based on the user's filter selections.
    * **Attachments:** It intelligently scans task references for GitHub links.
    * **User Roles:** It determines user roles ("Main Contributor" or "Reviewer") based on the order of assignment.
6. **Output:**
    * The script prompts the user for an export format and an output filename.
    * For CSV and Markdown, it allows the user to select specific columns.
    * If the user exports to Markdown, it offers an additional step to automatically format any found GitHub PR links into proper Markdown hyperlinks.
    * It compiles all the processed data and exports it to the specified file.
7. **Logging:** All operations, user choices, and errors are logged to a file in the `./logs` directory for easy debugging.

## Output Columns

The following data columns are available for export:

* **Name:** The display name of the user assigned to the task.
* **Role:** The role of the user for that task (Main Contributor, Reviewer, or blank).
* **Task:** The title of the Planner task.
* **Bucket:** The name of the bucket the task belongs to.
* **Attachments:** A semicolon-separated list of GitHub URLs found in the task's references. In Markdown exports, these can be automatically converted to clickable hyperlinks (e.g., `[PR#123](...)`).
* **Status:** The completion status of the task (Not Started, In Progress, or Completed).

## Thoth Tech information

`njykIFLDn0iAY1at7tACfcgADgBS` - Ontrack Planner ID
`mIelcQoIgkqhbM8WaPS3sMgAEmyV` - Splashkit Plan ID

**Date of Creation:** 22/08/2025
**Author:** Ibitope Fatoki