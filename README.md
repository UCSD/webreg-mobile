## UC San Diego - Webreg Mobile

UC San Diego - Webreg Mobile is the rolling release of the UC San Diego Webreg Web application for mobile platforms. This rolling release is for users interested in developing for, and experimenting with, the absolute latest version of the UC San Diego Webreg Webapp.

This version is intended for developers and designers and is absolutely, 100% NOT recommended for daily use. Rolling releases are not subject to the rigorous testing of the regular production release. Many things may (and probably are) only partially complete and are likely broken. 

If your feature or enhancement is selected as a possible release candidate, due to its sheer awesomeness or immediate need, it will go through an additional vetting process. Who knows? Your idea could be included in the next production release and help students navigate their UC San Diego experience for many classes to come. And give you a nice feather in your cap to show potential employers. If successful, your feature or enhancement will be published to the UC San Diego mobile app for its 30,000 users to experience, and you will be added as a collaborator on [mobile.ucsd.edu](https://mobile.ucsd.edu/).

We look forward to helping you become a published app developer!


## How to Contribute

### Creating a Fork

From the [Webreg Mobile GitHub repo](https://github.com/UCSD/webreg-mobile) click the "Fork" button. Next, use your favorite git client or command line to clone the repo:

```shell
# Clone your fork to your local machine
git clone git@github.com:YOUR-USERNAME/webreg-mobile.git
```

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


## How to Develop

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can’t go back!**

If you aren’t satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you’re on your own.

You don’t have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn’t feel obligated to use this feature. However we understand that this tool wouldn’t be useful if you couldn’t customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: https://facebook.github.io/create-react-app/docs/code-splitting

### Analyzing the Bundle Size

This section has moved here: https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size

### Making a Progressive Web App

This section has moved here: https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app

### Advanced Configuration

This section has moved here: https://facebook.github.io/create-react-app/docs/advanced-configuration

### Deployment

This section has moved here: https://facebook.github.io/create-react-app/docs/deployment

### `npm run build` fails to minify

This section has moved here: https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify
