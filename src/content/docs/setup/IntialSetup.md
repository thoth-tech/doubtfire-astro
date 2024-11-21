# IntialSetup
## Getting started to contribute 
The OnTrack system consists of a Ruby On Rails backend using the Grape API framework. Currently, the frontend is in the process of a migration from a AngularJS and Bootstrap 3.4 to **Angular 17** and **TailWindCSS**.

### Version Structure 
At ThothTech, Git is used as the version control system, with repositories stored on GitHub. This setup enables streamlined collaboration and efficient management of the OnTrack system’s large and complex codebase.
The OnTrack system is stored within three main repositories:
•	**doubtfire-web**: Contains the frontend codebase, which is the primary focus during the migration to Angular 17 and TailwindCSS.
•	**doubtfire-api**: Manages the backend using Ruby on Rails and the Grape API framework.
•	**doubtfire-deploy**: Handles deployment processes and release management.
While working on the OnTrack system, most migration efforts will be concentrated on the doubtfire-web repository for frontend updates and the doubtfire-api repository for backend adjustments, as necessary.

#### Ontrack Migration Initial Steps

To begin working on the OnTrack system migration, you will first need to fork the necessary repositories to your personal GitHub account. This ensures that any changes you make are isolated and can be reviewed before being merged into the main codebase.
**Step 1: Fork the Repositories**
The OnTrack system is stored in the following GitHub repositories, and you will primarily work within these two:
1.	**doubtfire-web (Frontend code)**
2.	**doubtfire-api (Backend code)**
To fork the repositories:
1.	Navigate to the repository URLs on GitHub:
o	 [doubtfire-web](https://github.com/thoth-tech/doubtfire-web)
o	 [doubtfire-api](https://github.com/thoth-tech/doubtfire-api)
2.	Click on the Fork button in the top-right corner of the repository page.
3.	This will create a copy of the repository under your personal GitHub account.

 ![alt text](image.png)

 **Step 2: Clone the Forked Repositories**
Once the repositories are forked, clone them to your local machine to start working:
1.	Open your terminal and use the following commands:
    **git clone https://github.com/<your-username>/doubtfire-web.git**
   **git clone https://github.com/<your-username>/doubtfire-api.git**
2.	Navigate to the respective directories: cd doubtfire-web
**Step 3: Set Up Upstream Repository**
To keep your forked repository in sync with the main repository, add the original repository as an upstream remote:
1.	Run the following commands:
**git remote add upstream https://github.com/<original-owner>/doubtfire-web.git**
**git remote add upstream https://github.com/<original-owner>/doubtfire-api.git**
2.	Verify the remotes:
**git remote -v**
You should see both origin (your fork) and upstream (the main repository).
**Step 4: Sync with Upstream**
Before starting any work, sync your fork with the upstream repository to ensure you have the latest updates:
1.	Fetch changes from upstream:
       **git fetch upstream**
2.	Merge them into your local branch:
     **git checkout main**
    **git merge upstream/main**
Now you are ready to start working on the OnTrack system migration, making changes within the doubtfire-web and doubtfire-api repositories as required.


