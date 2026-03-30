---
title: Initial Setup
---

## Task Management (Microsoft Planner)

- Ensure you have access to the **Thoth Tech** Microsoft Teams Channel. If not, please contact Morgaine so she can add you to the channel.
- Navigate to the **OnTrack** channel.
- Open the **OnTrack Planner Board** tab at the top to view and assign yourself to active tasks.
- If you cannot see the board, contact Brain Dang to be added to the cohort's workspace.

## Configuring Git (Global)

If this is your first time using Git on this machine, you must configure your identity. This information is attached to every commit you make.

1. **Set your name:**
```bash
git config --global.username "Your Name"
```
2. **Set your email:**
```bash
git config --global user.email "username@users.noreply.github.com"
```
:::note[Privacy Tip]
Using your GitHub-provided noreply email address keeps your personal email private in the public commit history. You can find your specific address in your GitHub Email Settings.
:::

## Cloning the Documentation

This enables you to contribute to the project documentation. You should also read the [documentation contribution guidelines](https://github.com/thoth-tech/documentation/blob/main/CONTRIBUTING.md).

Terminal window
```bash
git clone https://github.com/thoth-tech/doubtfire-astro.git
```

## WSL2

If you are on a Windows machine, then we recommend that you install WSL2.

## Get OnTrack Running on Local Machine

There are two ways to set up the project. We **strongly recommend** Option 1 for the most consistent experience.

### Option 1: VS Code Dev Containers (Recommended)

:::tip[Why choose this?]
This is the fastest setup method. It automatically configures Docker, Ruby, and Node.js inside a pre-set container, preventing almost all "it works on my machine" errors.
:::

1. **Prerequisites:** Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and the [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) in VS Code.
2. **Fork & Clone:** Fork and clone the 'doubtfire-deploy' repository as described in the Manual Setup below.
3. **Launch:** Open the folder in VS Code. When the pop-up appears in the bottom right, click **"Reopen in Container"**.
4. **Wait:** VS Code will build the environment. Once finished, you are ready to develop!

### Option 2: Manual Local Setup

Use this method if you prefer to manage dependencies (Ruby, Node, etc.) directly on your host machine. **Note:** On Windows, you will need a terminal that supports shell scripts (WSL2, MSYS2, or Cygwin).

1. **Fork the repositories:** Fork [doubtfire-deploy](https://github.com/thoth-tech/doubtfire-deploy), [doubtfire-api](https://github.com/thoth-tech/doubtfire-api), and [doubtfire-web](https://github.com/thoth-tech/doubtfire-web).
2. **Clone with Submodules:**
```bash
git clone --recurse submodules [https://github.com/YOUR_USERNAME/doubtfire-deploy](https://github.com/YOUR_USERNAME/doubtfire-deploy)
```
cd doubtfire-deploy
3. **Configure Remotes:** Run the following command to set your fork as the remote: 
```bash
./change_remotes.sh
```
4. **Add Team Remote:** Use the username provided by your Mentor: 
```bash
git remote add task-view-submission [https://github.com/PROVIDED_USERNAME/doubtfire-deploy](https://github.com/PROVIDED_USERNAME/doubtfire-deploy)
```
5. **Final Steps:** Follow the remaining instructions in the [doubtfire-deploy contributing file](https://github.com/doubtfire-lms/doubtfire-deploy/blob/development/CONTRIBUTING.md#working-with-docker-compose).


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