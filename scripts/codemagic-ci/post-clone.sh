#!/bin/sh
set -e
echo "Start: post-clone.sh"

echo "Checking required environment variables ..."
# 1. APP_VERSION
if [ -n "$APP_VERSION" ]; then
    echo "APP_VERSION: Found"
else
    echo "Error: APP_VERSION not found, exiting."
    exit 1
fi

# 2. BUILD_ENV
if [ -n "$BUILD_ENV" ]; then
    echo "BUILD_ENV: Found"
else
    echo "Error: BUILD_ENV not found, exiting."
    exit 1
fi

# 3. APP_CONFIG
if [ -n "$APP_CONFIG" ]; then
    echo "APP_CONFIG: Found"
else
    echo "Error: APP_CONFIG not found, exiting."
    exit 1
fi

# 4. SP_CONFIG
if [ -n "$SP_CONFIG" ]; then
    echo "SP_CONFIG: Found"
else
    echo "Error: SP_CONFIG not found, exiting."
    exit 1
fi

# 5. BUILD_PLATFORM
if [ -n "$BUILD_PLATFORM" ]; then
    echo "BUILD_PLATFORM: Found"
else
    echo "Error: BUILD_PLATFORM not found, exiting."
    exit 1
fi

echo "Installing Node.js ..."
curl "https://nodejs.org/dist/v14.16.0/node-v14.16.0.pkg" > "$HOME/Downloads/node-stable.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-stable.pkg" -target "/"
node --version

echo "Writing app-config.js from \$APP_CONFIG ..."
echo $APP_CONFIG | base64 --decode > ./scripts/codemagic-ci/app-config.js

echo "Writing sp-config.json from \$SP_CONFIG ..."
echo $SP_CONFIG | base64 --decode > ./scripts/codemagic-ci/sp-config.json

# Set env vars
echo "Setting build environment: $BUILD_ENV"
if [ "$BUILD_ENV" == "PROD" ]; then
    node ./scripts/codemagic-ci/set-env.js PROD $APP_VERSION $PROJECT_BUILD_NUMBER
    sh ./scripts/codemagic-ci/verify-env.sh PROD
elif [ "$BUILD_ENV" == "QA" ]; then
    node ./scripts/codemagic-ci/set-env.js QA $APP_VERSION $PROJECT_BUILD_NUMBER
    sh ./scripts/codemagic-ci/verify-env.sh QA
else
    echo "Error: BUILD_ENV not found, exiting."
    echo "End: post-clone.sh"
    exit 1
fi

echo "End: post-clone.sh"
