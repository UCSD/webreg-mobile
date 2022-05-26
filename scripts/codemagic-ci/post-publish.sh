#!/bin/sh
set -e
echo "Start: post-publish.sh"

if [ "$FCI_BUILD_STEP_STATUS" == "success" ]; then
    echo "Build success"
    echo "  Moving build/web ->  $APP_VERSION-$PROJECT_BUILD_NUMBER ..."
    cd build/
    mv web "$APP_VERSION-$PROJECT_BUILD_NUMBER"

    echo "  Removing old build assets from S3 ..."
    aws s3 rm s3://ucsd-its-sandbox-wts-charles/webreg-mobile --recursive

    echo "  Syncing build assets to S3 ..."
    aws s3 sync $APP_VERSION-$PROJECT_BUILD_NUMBER/ s3://ucsd-its-sandbox-wts-charles/webreg-mobile
elif [ "$FCI_BUILD_STEP_STATUS" == "skipped" ]; then
    echo "Build skipped - exiting."
    exit 1
elif [ "$FCI_BUILD_STEP_STATUS" == "failure" ]; then
    echo "Build failure - exiting."
    exit 1
fi

cd ../scripts/codemagic-ci
npm i

ENV_VARS=$( jq -n \
                  --arg fciBuildStepStatus "$FCI_BUILD_STEP_STATUS" \
                  --arg fciProjectId "$FCI_PROJECT_ID" \
                  --arg fciBuildId "$FCI_BUILD_ID" \
                  --arg appVersion "$APP_VERSION" \
                  --arg buildPlatform "$BUILD_PLATFORM" \
                  --arg buildNumber "$PROJECT_BUILD_NUMBER" \
                  --arg buildEnv "$BUILD_ENV" \
                  --argjson fciArtifactLinks "$FCI_ARTIFACT_LINKS" \
                  --arg buildBranch "$FCI_BRANCH" \
                  --arg commitHash "$FCI_COMMIT" \
                  --arg prNumber "$FCI_PULL_REQUEST_NUMBER" \
                  '{fciBuildStepStatus: $fciBuildStepStatus, fciProjectId: $fciProjectId, fciBuildId: $fciBuildId, appVersion: $appVersion, buildPlatform: $buildPlatform, buildNumber: $buildNumber, buildEnv: $buildEnv, fciArtifactLinks: $fciArtifactLinks, buildBranch: $buildBranch, commitHash: $commitHash, prNumber: $prNumber}' )

echo "Writing env-vars.json from \$ENV_VARS ..."
echo $ENV_VARS > env-vars.json

node ./build-notifier.js
echo "End: post-publish.sh"
