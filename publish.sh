#!/bin/bash

if [ "$1" == "development" ]
then
    STRINGTOREPLACE=aorta-arcturus
    REPLACEMENTSTRING=aorta-arcturus-dev
    ARGUMENT=s/${STRINGTOREPLACE}/${REPLACEMENTSTRING}/g

    sed -i {$ARGUMENT} package.json package-lock.json
fi

STRINGTOREPLACE=aortaarcturusversion
REPLACEMENTSTRING=$(npm view aorta-arcturus version)
ARGUMENT=s/${STRINGTOREPLACE}/${REPLACEMENTSTRING}/g

sed -i {$ARGUMENT} package.json package-lock.json
#npm version patch -git-tag-version false
npm publish