#!/bin/bash

# Variables
REPO_NAME="Programming-Study"
GITHUB_USER="sgouda0412"
GIT_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"

# Ensure we are inside the correct directory
cd "$(dirname "$0")"

# Initialize Git repository
git init

# Add a .gitignore file
echo -e "# Ignore everything except .gitkeep\n*!\n!.gitkeep" > .gitignore

# Add .gitkeep files to empty directories
find . -type d -empty -exec touch {}/.gitkeep \;

# Commit the empty directories
git add .
git commit -m "Initial commit with directory structure"

# Add remote and push (Assumes the repo is already created on GitHub)
git branch -M main
git remote add origin "$GIT_URL"
git push -u origin main

