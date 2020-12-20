#!/bin/bash

VERSION=$(cat README.md | grep "Version" | awk '{print $2}')

if [ -z "$1" ]
then
	echo 'use: ./run.sh <PROJ-DIR>'
	exit 1
fi

cd $1

docker run --rm -it \
	-v $(pwd):/src \
	-p 1313:1313 \
	--dns 8.8.8.8 \
	mooremachine/hugo-docker:$VERSION \
	shell

