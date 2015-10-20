#!/bin/bash

cd dist
rm lambda.zip
rm -R node_modules
cp -R ../output node_modules
find . -type f -name "*.purs" -delete
zip -r lambda.zip *
cd ..

