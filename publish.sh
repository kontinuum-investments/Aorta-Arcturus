#!/bin/sh

STRINGTOREPLACE=aorta-arcturus-version
CURRENTVERSION=$(npm view aorta-arcturus version)
ARGUMENT=s/${STRINGTOREPLACE}/${CURRENTVERSION}/g

sed -i {$ARGUMENT} package.json package-lock.json
npm version patch -git-tag-version false
npm publish