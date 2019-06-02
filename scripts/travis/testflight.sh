#!/bin/sh
#if [[ "$TRAVIS_PULL_REQUEST" = "true"  ]]; then
#echo "This is not a pull request. No deployment will be done."
#exit 0
#fi
if [[ "$TRAVIS_BRANCH" != "development" ]]; then
echo "Testing on a branch other than development. No deployment will be done."
exit 0
fi
fastlane beta
