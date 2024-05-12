# Contributing to Doubtfire Astro Repository

This guide provides high-level details on how to contribute to the Doubtfire repositories. This repository reflects the code for Ontrack documentation website. 

The Ontrack documentation website is a centralised repository for recording all technical documentation for Ontrack project. 

## Background

The **doubtfire-astro** project provides the base repository containing information on technical document for OnTrack project. 

The OnTrack project contains following submodules:
- [doubtfire-api](https://github.com/thoth-tech/doubtfire-api) contain the backend RESTful API. This uses Rails' [active model](https://guides.rubyonrails.org/active_model_basics.html) with the [Grape REST api framework](https://github.com/ruby-grape/grape).
- [doubtfire-web](https://github.com/thoth-tech/doubtfire-web) hosts the frontend code implemented in [Angular](https://angular.io) and [AngularJS](https://angularjs.org). This implements the web application that connects to the backend api.
- [doubtfire-overseer](https://github.com/thoth-tech/doubtfire-overseer) provides facilities to run automated tasks on student submissions. Please get in touch with the core team if you want access to this repository. 


### Working on onTrack documentation website

To get started:

1. Fork [doubtfire-astro](https://github.com/thoth-tech/doubtfire-astro)

    To push your contributions, you will need a fork of each repository. Contributions can then be made by making pull requests back into the main repositories.

2. Clone your [doubtfire-astro](https://github.com/thoth-tech/doubtfire-astro). 

    `git clone https://github.com/YOUR_USERNAME/doubtfire-astro`

3. Open the cloned repository in VS code 
  - Open VS code
  - Navigate to File and select ```Open folder``` 
  - Select the folder where you have cloned this repository
  - you will be able to see all the files now

4. To make changes/ add content to OnTrack Technical documentation website 
  - Go to the ```scr``` folder
  - New Pages can be added or changes to existing pages can be made by navigating to ```content``` folder 
  - Images are required to be stored under ```assets``` folder

5. Note - when adding new pages you would need to do following 
  - Make changes to ```content``` and also the ```astro.config.mjs``` file in parallel
  e.g. We have a page for backend API list api_list.md the path of this needs to be mention in ```astro.config.mjs``` file 
    ```
    items: [
              {
                label: 'Doubtfire API Documentation List',
                link: '/backend/api/api_list',
              },
          ]
    ```

6. To see changes and verify changes being made are reflecting in Website follow the below steps:
  - Open node terminal in your VS code project
  - Run the command ```npm run dev``` 
  - This will load the website locally
  - For any additional commands on Starlight refer to ```starlight.md```



## Pushing changes to Thoth Tech doubtfire-astro repository 

To start work on a new feature.

1. Make your changes in locally
2. Create a **draft** [Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and document the change you are working on. Doing this early will make sure that you get feedback on your work quickly.
4. Complete your work, pushing to your fork's feature branch. This will update your existing PR (no need to create new PRs)
5. Update the status of your PR removing the **draft** status, and flag someone in the Core team to review and incorporate your work.
6. Address any changes required. Pushing new commits to your branch to update the PR as needed.
7. Once your PR is merged you can delete your feature branch and repeat this process for new features...



### Ensure you have your author credentials set up

You should ensure your git user config details are set to the email address you use with GitHub:

```bash
git config --global user.email "my-github-email@gmail.com"
git config --global user.name "Freddy Smith"
```

### Key Github commands

**Step 1.** Make changes, and repeat until you are done:

```bash
$ git add ... ; git commit ; git push     # make changes, commit, and push to origin
```

**Step 2.** Submit a pull request and **if unable to merge**:

```bash
$ git pull --ff upstream <add branch name>      # merge upstream's branch in your feature branch
$ git add ... ; git commit                # resolve merge conflicts and commit
$ git push origin                         # push your merge conflict resolution to origin
```


## Commit Message Format

We have precise rules over how our Git commit messages must be formatted. This format makes it easier to read the commit history.

Each commit message consists of a header, a body, and a footer.

```text
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The `header` is mandatory and must conform to the Commit Message Header format.

The `body` is recommended for all commits. When the body is present, it must be at least 20 characters long and conform to the Commit Message Body format.

The `footer` is optional. The Commit Message Footer format describes the purpose and structure of the footer.

Any line of the commit message should be 100 characters or fewer.

```text
Commit Message Header
<type>(<scope>): <short summary>
  │       │             │
  │       │             └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │       │
  │       └─⫸ Commit Scope (optional): animations|common|style|forms|http|router|service-worker|
  │                                     upgrade|changelog|dev-infra|docs-infra|migrations|
  │
  └─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test
```

The `<type>` and `<summary>` fields are mandatory, the `(<scope>)` field is optional.

The `<type>` must be one of the following:

- **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
- **ci**: Changes to our CI configuration files and scripts (example scopes: Circle, BrowserStack, SauceLabs)
- **docs**: Documentation only changes
- **feat**: A new feature
- **fix**: A bug fix
- **perf**: A code change that improves performance
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **test**: Adding missing tests or correcting existing tests

We recommend reading Chris Beam's post on [How to Write Good Commit Messages](http://chris.beams.io/posts/git-commit/).

### Use the imperative mood in your commit subject line

Write your commits in the imperative mood and not the indicative mood

- "Fix a bug" and **not** "Fix*ed* a bug"
- "Change the behaviour of Y" and **not** "*Changed* the behaviour of Y"
- "Add new API methods" and **not** "Sweet new API methods"

Keep the subject line (top line) concise; keep it **within 50 characters**.

Use the body (lines after the top line) to explain why and what and *not* how; keep it **within 72 characters**.

### But how can I write new lines if I'm using `git commit -m "Message"`?

Don't use the `-m` switch. Use a text editor to write your commit message instead.

