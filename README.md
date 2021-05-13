## UC San Diego - Webreg Mobile
UC San Diego - Webreg Mobile is the rolling release of the UC San Diego Webreg mobile web application built with the Flutter Web SDK. This rolling release is for users interested in developing for, and experimenting with, the absolute latest version of the UC San Diego Webreg mobile web application.

This version is intended for developers and designers and is absolutely, 100% NOT recommended for daily use. Rolling releases are not subject to the rigorous testing of the regular production release. Many things may (and probably are) only partially complete and are likely broken. 

If your feature or enhancement is selected as a possible release candidate, due to its sheer awesomeness or immediate need, it will go through an additional vetting process. Who knows? Your idea could be included in the next production release and help students navigate their UC San Diego experience for many classes to come. And give you a nice feather in your cap to show potential employers. If successful, your feature or enhancement will be published to the UC San Diego mobile app for its 30,000 users to experience, and you will be added as a collaborator on [mobile.ucsd.edu](https://mobile.ucsd.edu/).

We look forward to helping you become a published app developer!


## How to Contribute

### Creating a Fork
From the [Webreg Mobile GitHub repo](https://github.com/UCSD/webreg-mobile) click the "Fork" button. Next, use your favorite git client or command line to clone the repo:

### Keeping Your Fork Up to Date
You'll want to make sure you keep your fork up to date by tracking the original "upstream" repo that you forked. To do this, you'll need to add a remote:

```shell
# Add 'upstream' repo to list of remotes
git remote add upstream https://github.com/UCSD/webreg-mobile.git
```

Whenever you want to update your fork with the latest upstream changes, you'll need to first fetch the upstream repo's branches and latest commits to bring them into your repository:
```shell
# Fetch from upstream remote
git fetch upstream
```

Now you are ready to checkout your local `main` branch and merge in any changes from the upstream repo's `main` branch:
```shell
# Checkout your master branch and merge upstream
git checkout main
git merge upstream/main
```

Your local `main` branch is now up-to-date with any changes upstream.

### Doing Your Work


#### Create a Feature Branch
When you begin working on a new feature or bugfix, it is important that you create a new branch. Not only is it proper git workflow, but it also keeps your changes organized and separated from the `main` branch so that you can easily submit and manage multiple pull requests for every task you complete.

To create a new branch and start working on it:

```shell
# Checkout the experimental branch
git checkout main

# Create and checkout a branch named newfeature
git checkout -b newfeature
```

You are now ready to begin developing your new feature. Commit your code often, using present-tense and concise verbiage explaining the work completed.

Example: Add, commit, and push your new feature:
```shell
# Show the state of staged and unstaged files you created or updated
git status

# Add files to include in your newfeature
git add src/App.jsx

# Commit your code
git commit -m "Add custom filter"

# Push your code
git push -u origin newfeature

```


### Submitting a Pull Request

#### Update your feature branch
From the time you created your new feature branch `newfeature`, to submitting a pull request, it is likely that your branch 

Branch `upstream/main` is updated often. Prior to submitting a pull request, update your `newfeature` branch from `upstream/main` so that merging it will be a simple process which won't require any conflict resolution work.
```shell
# Fetch upstream experimental and merge with your local experimental branch
git fetch upstream
git checkout main
git merge upstream/main

# If there were any new commits, merge them from `experimental` and update your branch
git checkout newfeature
git merge main
git push origin newfeature
```


#### Submitting
Once you've committed and pushed your feature branch `newfeature` to GitHub, go to the page for your fork on GitHub, select branch 'newfeature' and click the 'New pull request' button.

If you need to make future updates to your pull request, push the updates to your feature branch `newfeature` on GitHub. Your pull request will automatically track the changes on your feature branch and update.


## Quick Start Guide
1. [Install Flutter](https://flutter.dev/docs/get-started/install)
2. Clone your webreg-mobile fork
```shell
git clone git@github.com:YOUR-USERNAME/webreg-mobile.git
```
3. Install project dependencies
```sh
cd webreg-mobile
flutter pub get
```
4. Run webreg-mobile in your local browser
```sh
flutter run -d chrome
```
