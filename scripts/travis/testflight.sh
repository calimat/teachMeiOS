#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" AND "$TRAVIS_BRANCH" == "development" ]]; then
echo "Pull request on a development branch. Uploading to testflight"
fastlane beta
fi
