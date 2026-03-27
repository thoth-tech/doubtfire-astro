# src

## Purpose
The `src` directory contains all the core resources required for the OnTrack documentation project. This includes static assets, technical documentation, and configuration for the Astro framework.

## Structure
### 1. `assets/`
- **Purpose**: Stores static files such as images and media.
- **Contents**:
  - `houston.webp`: Related to the Houston project.
  - `ontrack.webp`: Associated with the OnTrack project.

### 2. `content/`
- **Purpose**: Holds the main technical documentation for OnTrack.
- **Subdirectories**:
  - **`docs/`**: Contains detailed documentation for different components:
    - **`backend/`**: API-related documentation (e.g., `api_list.md`, `students.md`).
    - **`courseflow/`**: Documents workflows and future plans (e.g., `current_stage.md`, `requirements.md`).
    - **`document/`**: Introductory documentation and setup information.
  - **`frontend/`**: Documentation for the frontend setup (e.g., `page.md`).
  - **`setup/`**: Contains setup guides (e.g., `set.md`).

## Notes
- Follow **snake_case** for naming new files and directories.
- New images should be stored in the `assets/` folder.
- When adding pages, ensure to update the `astro.config.mjs` file to link them correctly.

