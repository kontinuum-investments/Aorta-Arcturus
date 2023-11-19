#!/bin/sh

BRANCHNAME=${GITHUB_REF#refs/heads/}
DEVBRANCHNAME=development

if [ "${BRANCHNAME,,}" == "${DEVBRANCHNAME,,}" ]; then
    STRINGTOREPLACE=aorta-arcturus
    REPLACEMENTSTRING=aorta-arcturus-dev
    ARGUMENT=s/${STRINGTOREPLACE}/${REPLACEMENTSTRING}/g

    sed -i {$ARGUMENT} package.json package-lock.json
fi

STRINGTOREPLACE=aorta-arcturus-version
REPLACEMENTSTRING=$(npm view aorta-arcturus version)
ARGUMENT=s/${STRINGTOREPLACE}/${REPLACEMENTSTRING}/g

sed -i {$ARGUMENT} package.json package-lock.json
npm version patch -git-tag-version false
npm publish