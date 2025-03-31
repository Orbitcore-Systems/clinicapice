#!/bin/bash

VERSION=1
MINOR=1
PATCH=1
EXTRAVERSION=""

NOTES="arrumado falha no hamburger do navbar que não estava responsivo."
BRANCH="main"

set -e

if [[ -z $PATCH ]]; then
    PATCH=""
else
    PATCH=".$PATCH"
fi

if [[ $EXTRAVERSION == *"-rc"* ]]; then
    FULL_VERSION="$VERSION.$MINOR$PATCH$EXTRAVERSION"
else

    if [[ -z $EXTRAVERSION ]]; then
        FULL_VERSION="$VERSION.$MINOR$PATCH"
    else
        FULL_VERSION="$VERSION.$MINOR$PATCH.$EXTRAVERSION"
    fi
fi

git add .
git commit -m "$FULL_VERSION $NOTES"
git push -u origin $BRANCH
git tag v$FULL_VERSION
git push --tags

echo "Build $FULL_VERSION completed successfully!"