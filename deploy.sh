#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
env HUGO_ENV="production" hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd ..

cd adityasapate.github.io

cp -av ./../mywebsite-hugo/public/* .

# Add changes to git.
git add --all

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push -u origin master

# Come Back
cd ..
