
#!/bin/bash

# Variables
REPO_NAME="Programming-Study"
GITHUB_USER="sgouda0412"
GIT_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"

# Ensure we are inside the correct directory
cd "$(dirname "$0")"

# Initialize Git repository (if not already initialized)
if [ ! -d ".git" ]; then
    git init
fi

# Add a .gitignore file
echo -e "# Ignore everything except .gitkeep\n*!\n!.gitkeep" > .gitignore

# Add .gitkeep files to empty directories
find . -type d -empty -exec touch {}/.gitkeep \;

# Add and commit changes
git add .
git commit -m "Initial commit with directory structure"

# Check if remote 'origin' exists
if git remote get-url origin &>/dev/null; then
    echo "Remote 'origin' already exists."
else
    git remote add origin "$GIT_URL"
fi

# Pull the latest changes to avoid conflicts
git fetch origin
git rebase origin/main || git merge origin/main

# Push changes to GitHub
git push origin main

