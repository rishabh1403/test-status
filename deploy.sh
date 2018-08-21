#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

#create backup dir if not present
mkdir publicbak

#create a backup
echo -e "\033[0;32mMaking a backup copy...\033[0m"
cp -v -r public/* publicbak/

#clean up public
echo -e "\033[0;32mDeleting old copy...\033[0m"
rm -rf public/*

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
