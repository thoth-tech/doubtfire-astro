---
title: Initial Setup
description: Guide for setting up the local development environment.
lastUpdated: 19-04-2026
author: Anagh Wadhwa
---

## Configuring Git (Global)

Before contributing to OnTrack, you must configure your Git identity. This information is attached to every commit you make.

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

To contribute to the technical documentation, clone the doubtfire-astro repository:
```bash
git clone [https://github.com/thoth-tech/doubtfire-astro.git](https://github.com/thoth-tech/doubtfire-astro.git)
```

## Development Environment Setup

There are two primary ways to set up the OnTrack project locally. We **strongly recommend** Option 1 for the most consistent experience across different operating systems.

## Option 1: VS Code Dev Containers (Recommended)

:::tip[Why choose this?]
This is the fastest setup method. It automatically configures Docker, Ruby, and Node.js inside a pre-set container, preventing environment-specific errors.
:::

1. **Prerequisites:** Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and the [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) in VS Code.
2. **Fork & Clone:** Fork and clone the 'doubtfire-deploy' repository as described in the Manual Setup below.
3. **Launch:** Open the folder in VS Code. When the pop-up appears in the bottom right, click **"Reopen in Container"**.
4. **Wait:** VS Code will build the environment. Once finished, you are ready to develop!

## Option 2: Manual Local Setup

Use this method if you prefer to manage dependencies (Ruby, Node, etc.) directly on your host machine. **Note:** On Windows, you will need a terminal that supports shell scripts (WSL2, MSYS2, or Cygwin).

1. **Fork the repositories:** Fork [doubtfire-deploy](https://github.com/thoth-tech/doubtfire-deploy), [doubtfire-api](https://github.com/thoth-tech/doubtfire-api), and [doubtfire-web](https://github.com/thoth-tech/doubtfire-web).
2. **Clone with Submodules:**
```bash
git clone --recurse submodules [https://github.com/YOUR_USERNAME/doubtfire-deploy](https://github.com/YOUR_USERNAME/doubtfire-deploy)
cd doubtfire-deploy
```
3. **Configure Remotes:** Run the following command to set your fork as the remote: 
```bash
./change_remotes.sh
```
4. **Final Steps:** Follow the remaining instructions in the [doubtfire-deploy contributing file](https://github.com/doubtfire-lms/doubtfire-deploy/blob/development/CONTRIBUTING.md#working-with-docker-compose).

## Contribution Workflow

Once your environment is set up, you can begin contributing to the project:
- **Explore the Architecture:** Familiarise yourself with how the Angular frontend communicates with the Rails API.
- **Review Issues:** Check the repository's GitHub Issues for a list of bugs or feature requests.
- **Documentation Updates:** Ensure all guides match the current repository structure and technical requirements of the latest OnTrack release.