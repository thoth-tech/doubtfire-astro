---
title: Doubtfire Setup & Common Issues (Kali VM / Docker)
---

# Doubtfire Setup & Common Issues  
**(Kali VM / Docker)**

> **Note:**  
> This guide is primarily intended for building and running Doubtfire on virtual machines (VMs), especially in scenarios such as penetration testing, security assessments, or isolated development environments. It provides step-by-step instructions for setup, troubleshooting, and optimizing performance in VM contexts.

## Pre-requisites

- A Linux environment (VM or native install).  
  _This guide uses Kali Linux in a VM (VirtualBox or VMware)._
- At least **8 GB RAM** and **25 GB disk space** for your VM.
- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.
- [VS Code](https://code.visualstudio.com/) installed.

> **Tip:** If your VM lags, consider increasing CPU cores.

---

## 1. Docker Installation

### Install Docker & Docker Compose (Debian-based distros)

```bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install docker.io docker-compose -y
```

### Confirm Installation

```bash
docker --version
```

---

## 2. Folder and Git Setup

```bash
mkdir ~/dev && cd ~/dev
git clone https://github.com/thoth-tech/doubtfire-deploy.git
cd doubtfire-deploy

mkdir ~/doubtfire-web
cd ~/doubtfire-web
git clone https://github.com/thoth-tech/doubtfire-web.git
cd ..

mkdir ~/doubtfire-api
cd ~/doubtfire-api
git clone https://github.com/thoth-tech/doubtfire-api.git
```

### Folder Structure

```bash
~/dev
└── doubtfire-deploy
    ├── (contents of doubtfire-deploy)
    ├── doubtfire-web
    │   └── (contents of doubtfire-web)
    └── doubtfire-api
        └── (contents of doubtfire-api)
```

- Run `git branch --v` to confirm you are on the `development` branch in all three repos.

---

## 3. VS Code & Dev Container

- Ensure Docker is running.
- Open the `doubtfire-deploy` directory in VS Code using the **Dev Container** extension.
- Monitor the progress in the terminal window.  
  _This will take some time to build the container and install dependencies._

> **Important:**  
> VS Code might prompt you to update services.  
> **Do NOT update** as this will break the build and cause stealth issues.

---

## 4. Build Output

Once the container is built and running, a terminal will open and split into two:  
- One will build **doubtfire-web**
- The other will build **doubtfire-api**

_Be patient; this will take some time._

### Example Output

#### doubtfire-web

```bash
[serve:angular17] polyfills.js| polyfills| 86.08 kB
[serve:angular17]| Initial total | 4.46 MB
[serve:angular17] Application bundle generation complete. [35.894 seconds]
[serve:angular17] Watch mode enabled. Watching for file changes... ←
[serve:angular17] Local: http://localhost:4200/
[serve:angular17] → Network: http://172.17.0.2:4200/
[serve:angular17] → press h + enter to show help
```

#### doubtfire-api

```bash
Run `bundle fund for details => Booting Puma
=> Rails 7.1.3.3 application starting in development
=> Run `bin/rails server --help for more startup options
Puma starting in single mode...
* Puma version: 6.4.2 (ruby 3.1.4-p223) ("The Eagle of Durango")
* Min threads: 5
* Max threads: 5
* Environment: development
* PID: 848
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```
- With this, the build on `development` is complete.

---

## 5. Building on `9.x` Branch

### Steps

1. **Close VS Code** and stop the running Docker container.
2. Using a terminal, navigate to each of `doubtfire-web`, `doubtfire-api`, and `doubtfire-deploy` directories and run:

    ```bash
    git switch 9.x
    ```

3. Run `git branch` to confirm you are on the `9.x` branch in all three repos.
4. In `doubtfire-web`:
    - Delete the `package-lock.json` file.
    - Edit `package.json`:
      - Change `"ng2-pdf-viewer": "^10.2"` to `"ng2-pdf-viewer": "10.2.2"`.
      - Search for `ng serve` and add `--poll=2000` after it:  
        `... ng serve --poll=2000 ...`
    - Save and close the file.
5. Open Docker and:
    - Delete any existing container named **lmsdoubtfire**.
    - Go to the **Volumes** tab and delete all volumes (do **not** delete anything from the "Images" tab).
6. Reopen the `doubtfire-deploy` folder in VS Code using the **Dev Container** extension.
7. Monitor the progress in the terminal window.  
   _It will successfully build on `9.x` this time._

> **Reminder:**  
> VS Code might prompt you to update services.  
> **Do NOT update** as this will break the build and cause stealth issues.

---

## 6. Troubleshooting

### Ruby Version Mismatch

If you see:

```
Your Ruby version is 3.1.7, but your Gemfile specified ~> 3.3.0
```

- You updated your services and now the build fails with a Ruby version mismatch.
- You need to uninstall that version and install the correct one.
- Use `rbenv` to manage Ruby versions.

---

### Migration / DB State Issues

If the API container fails with MySQL migration errors (indexes missing)

#### **Fix – Clean Reset**

Inside `~/doubtfire/doubtfire-deploy`:

```bash
docker-compose -f development/docker-compose.yml down -v
docker-compose -f development/docker-compose.yml up --build
```

- This wipes volumes (databases) and rebuilds fresh.

---

### Performance Issues – Extreme Latency

If the VM freezes or lags heavily after starting:

- **Cause:**  
  Angular + Rails + MySQL + Redis + Overseer containers are **very resource intensive**.
- **Example:**  
  Running with only **2 GB RAM** in Kali VM makes the system unusable.


#### **Fix – Increase VM Resources**

- Increase VM memory from **2 GB → 8 GB**.
- 4 GB may work, but **2 GB is too low**.
- **Recommended (if you have 64 GB RAM):**
  - **RAM:** 8–12 GB
  - **CPUs:** 4–6
  - **Disk:** 25 GB+

---

## 7. Final Success

After these steps, the system should build and run at:

- **Web:** [http://localhost:4200](http://localhost:4200)
- **API:** [http://localhost:3000](http://localhost:3000)
- **Overseer:** [http://localhost:8080](http://localhost:8080)

---

## 8. Development vs Production Mode

By default, the environment starts in **development mode**. This exposes several features and endpoints for easy testing and debugging.

- **Development mode** is intended for local development and testing.
- Some services and ports may be exposed for convenience.

### Switching to Production Mode

To build and run in **production mode**:

1. Open the `package.json` file in the `doubtfire-web` directory.
2. Locate the following line:
   ```json
   "build:angular17": "ng build",
   ```
3. Change it to:
   ```json
   "build:angular17": "ng build --configuration production",
   ```
4. Save the file and rebuild the project.

This will ensure Angular is built with production optimizations and disables development-only features.
