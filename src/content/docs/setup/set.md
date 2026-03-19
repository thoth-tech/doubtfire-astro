---
title: Initial Setup
---

## Task Management (Microsoft Planner)

- Ensure you have access to the **Thoth Tech** Microsoft Teams Channel. If not, please contact Morgaine so she can add you to the channel.
- Navigate to the **OnTrack** channel.
- Open the **OnTrack Planner Board** tab at the top to view and assign yourself to active tasks.
- If you cannot see the board, contact Brain Dang to be added to the cohort's workspace.

## Configuring git (global)

If you haven’t already, you must configure git.

1. Set your git username by git config –global user.name “FIRST_NAME LAST_NAME”, whereFIRST_NAME is your first name and LAST_NAME is your last name.
2. Set your git email by git config –global user.email “YOUR_EMAIL”, where YOUR_EMAIL is your email. It is advised that you use your @users.noreply.github.com email address, which is, by default, &lt;username&gt;@users.noreply.github.com, where &lt;username&gt; is your GitHub username.

## Cloning the Documentation

This enables you to contribute to the project documentation. You should also read the [documentation contribution guidelines](https://github.com/thoth-tech/documentation/blob/main/CONTRIBUTING.md).

Terminal window

git clone https://github.com/thoth-tech/doubtfire-astro.git

## WSL2

If you are on a Windows machine, then we recommend that you install WSL2.

## Get OnTrack Running on Local Machine

You need a terminal that supports shell scripts (on Windows, you need WSL2, Msys2, or Cygwin).

1. Fork [doubtfire-deploy](https://github.com/doubtfire-lms/doubtfire-deploy), [doubtfire-api](https://github.com/doubtfire-lms/doubtfire-api), and [doubtfire-web](https://github.com/doubtfire-lms/doubtfire-web)
2. Clone your [doubtfire-deploy](https://github.com/doubtfire-lms/doubtfire-deploy). Make sure to fetch submodules to get the sub-projects.

Terminal window

git clone –recurse-submodules <https://github.com/YOUR_USERNAME/doubtfire-deploy>

1. cd into the directory.

Terminal window

cd doubtfire-deploy

1. Open a terminal that supports sh scripts (on Windows, you require WSL2, Msys2, or Cygwin). Run the following command to set your fork as the remote.

Terminal window

./change_remotes.sh

1. Your delivery lead provides you with the GitHub username to use in this command. This allows you to use git fetch task-view-submission, git pull task-view-submission, and git push task-view-submission.

Terminal window

git remote add task-view-submission <https://github.com/PROVIDED_USERNAME/doubtfire-deploy>

1. You can now follow the remaining instructions, from instruction four, in the doubtfire-deploy [contributing file](https://github.com/doubtfire-lms/doubtfire-deploy/blob/development/CONTRIBUTING.md#working-with-docker-compose).

## What Next?

Now that your environment is set up, familiarise yourself with the current project goals and documentation.

- **Check the Planner Board:** Navigate to the [OnTrack Planner Board](https://planner.cloud.microsoft/webui/plan/njykIFLDn0iAY1at7tACfcgADgBS/view/board?tid=d02378ec-1688-46d5-8540-1c28b5f470f6) to view the current backlog.
- **T1 2026 Cohort Update:** Assist in updating all project references from 2025 to the current **T1 2026** cohort.
- **Refine Guides and Tutorials:** Review existing setup files (like this one!) to ensure they match the current repository structure ('doubtfire-astro').
- **Techical Documentation:**
    - **Timestamp & Author:** Implement a global "last updated" and "author" field for all documentation pages.
    - **Repository Cleanup:** Tidy the Microsoft Teams and Sharepoint documentation repositories to remove redundant legacy files.
- **Pull Request Management:** Monitor and close out any remaining pull requests against the documentation repositories to keep the main branch clean.

## Technical & Specialised Tasks

- **Security & Databases:** If you have specialised knowledge in cyber-security or database adminstration, check the specialised tasks on the Planner board for implementation reviews.
- **Git Integration:** Examine how Git can be better implemented on the back-end of the OnTrack product as part of the current sprint.

## Helpful Points

- If you are using Windows as your primary operating system and you have not downloaded, installed, and/or set-up MinGW, then a former team found the Linux subsystem [WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install) and [Docker Desktop WSL 2 backend](https://docs.docker.com/desktop/windows/wsl/) as a helpful development environment.
