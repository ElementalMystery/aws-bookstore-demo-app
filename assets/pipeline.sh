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

if [ $? == 1 ]; then
    echo 'A test has Failed - Pipeline Abandoned'
    exit 2
fi

echo 'All tests have Passed'
cd ../../

git add .
git commit -m $1
git push origin master
git status

npm run start