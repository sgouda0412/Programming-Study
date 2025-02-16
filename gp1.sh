#!/bin/bash

# Variables
REPO_NAME="Programming-Study"
GITHUB_USER="your_github_username"
GIT_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"

# Set the base directory
BASE_DIR="$HOME/Documents/Programming-Study"

# Ensure we are inside the correct directory
cd "$BASE_DIR" || { echo "Directory $BASE_DIR not found!"; exit 1; }

# Initialize Git repository if not already initialized
if [ ! -d ".git" ]; then
    git init
fi

# Add a .gitignore file to avoid unnecessary files
echo -e "# Ignore everything except .gitkeep\n*!\n!.gitkeep" > .gitignore

# Create .gitkeep files inside empty directories
find . -type d -empty -exec touch {}/.gitkeep \;

# Add and commit changes
git add .
git commit -m "Initial commit with all directories"

# Check if remote 'origin' exists
if git remote get-url origin &>/dev/null; then
    echo "Remote 'origin' already exists."
else
    git remote add origin "$GIT_URL"
fi

# Pull latest changes from remote to avoid conflicts
git fetch origin
git rebase origin/main || git merge origin/main

# Push the changes to GitHub
git push origin main

