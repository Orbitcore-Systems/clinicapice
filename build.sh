#!/bin/bash

VERSION=2
MINOR=1
PATCH=0
EXTRAVERSION=""

NOTES="Atualizado informações; Removido a parte referente a Neurologia e suavisado a parte onde parece uma montanha no layout,

Assited-by: Claude:5.5 Sonnet [Anthropic]"
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
