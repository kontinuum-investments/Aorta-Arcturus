#!/bin/bash

if [ "$1" == "development" ]
then
    KEY=aorta-arcturus
    VALUE=aorta-arcturus-dev
    ARGUMENT=s/${KEY}/${VALUE}/g

    sed -i {$ARGUMENT} package.json package-lock.json
fi

KEY=aortaarcturusversion
VALUE=$(npm view aorta-arcturus-dev version)
ARGUMENT=s/${KEY}/${VALUE}/g

sed -i {$ARGUMENT} package.json package-lock.json
npm version patch -git-tag-version false
npm publish