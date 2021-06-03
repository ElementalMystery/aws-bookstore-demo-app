# !/usr/bin/env bash

sCheck=$(python staticCheck.py)

# IF the staticCheck picks up an error
if [ "$sCheck" != 1 ]; then
    #Print response and exit
    echo
    echo 'Static Test Failed:'
    echo "$sCheck"
    exit 2
fi
echo
# Print success message
echo 'Static Test Successful'

npm install
npm run build

cd ./src/__tests__
npm run test
cd ../../..

git add .
git commit -m $1
git push origin master
git status