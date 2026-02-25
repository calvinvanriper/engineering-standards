#!/usr/bin/env bash

# Initialize a new repository with engineering standards
# Usage:
#   ./scripts/init-standards-repo.sh ../new-repo

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT_DIR"

# Guard: must run from engineering-standards root
if [ ! -d "config/vscode" ] || [ ! -d "config/prettier" ] || [ ! -d "config/eslint" ]; then
  echo "Error: must be run from engineering-standards repository root"
  exit 1
fi

# Guard: require target path
if [ -z "$1" ]; then
  echo "Error: target repository path required"
  echo "Usage: ./scripts/init-standards-repo.sh ../new-repo"
  exit 1
fi

TARGET_REPO="$1"

# Guard: target must exist
if [ ! -d "$TARGET_REPO" ]; then
  echo "Error: target directory does not exist: $TARGET_REPO"
  echo "Create it first, then re-run this script."
  exit 1
fi

# Guard: target must be empty
if [ -n "$(ls -A "$TARGET_REPO")" ]; then
  echo "Error: target directory is not empty: $TARGET_REPO"
  echo "Refusing to initialize to prevent overwriting files."
  exit 1
fi

echo "Initializing standards in: $TARGET_REPO"
echo ""

# Create required directory structure
mkdir -p "$TARGET_REPO/config/prettier"
mkdir -p "$TARGET_REPO/config/eslint"
mkdir -p "$TARGET_REPO/config/vscode"
mkdir -p "$TARGET_REPO/git"
mkdir -p "$TARGET_REPO/.vscode"

# Copy standards authority mirror
echo "Copying standards authority..."
cp -r config/prettier/. "$TARGET_REPO/config/prettier/"
cp -r config/eslint/. "$TARGET_REPO/config/eslint/"
cp -r config/vscode/. "$TARGET_REPO/config/vscode/"
cp -r git/. "$TARGET_REPO/git/"

if [ -d ".github" ]; then
  mkdir -p "$TARGET_REPO/.github"
  cp -r .github/. "$TARGET_REPO/.github/"
fi

# Copy enforcement layer
echo "Copying enforcement layer..."
cp -r config/vscode/. "$TARGET_REPO/.vscode/"

# Activate Prettier baseline
echo "Activating Prettier baseline..."
cp config/prettier/.prettierrc.json "$TARGET_REPO/.prettierrc.json"
cp config/prettier/.prettierignore "$TARGET_REPO/.prettierignore"

# Create README template
echo "Creating README..."
cat > "$TARGET_REPO/README.md" << 'EOF'
# New Repository

<!-- prettier-ignore -->
**Engineering Standards:** v1.0.0 · **Baseline Authority:** engineering-standards

## Overview

Describe the purpose of this repository here.

## Development

This repository follows engineering-standards baseline configuration.
EOF

# Initialize git repository
echo "Initializing git..."
cd "$TARGET_REPO"
git init
git config commit.template git/.gitmessage.txt

git add .

git commit -m "chore(init): initialize repository with engineering standards baseline"

echo ""
echo "Repository initialized successfully."
echo ""
echo "Next steps:"
echo "  cd $TARGET_REPO"
echo "  git remote add origin <repository-url>"
echo "  git push -u origin main"
