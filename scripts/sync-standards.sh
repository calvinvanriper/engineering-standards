#!/usr/bin/env bash

# Sync engineering standards into a target repository
# Usage:
#   ./scripts/sync-standards.sh ../target-repo

set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT_DIR"

if [ ! -d "config/vscode" ] || [ ! -d "config/prettier" ] || [ ! -d "config/eslint" ]; then
  echo "Error: must be run from the engineering-standards repository root"
  echo "Tip: cd to engineering-standards and run: ./scripts/sync-standards.sh <target>"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Error: target repository path required"
  echo "Usage: ./scripts/sync-standards.sh ../target-repo"
  exit 1
fi

TARGET_REPO="$1"

if [ ! -d "$TARGET_REPO" ]; then
  echo "Error: target repository does not exist: $TARGET_REPO"
  exit 1
fi

echo "Syncing standards to: $TARGET_REPO"
echo ""

# Ensure destination dirs exist
mkdir -p "$TARGET_REPO/config/prettier" \
         "$TARGET_REPO/config/eslint" \
         "$TARGET_REPO/config/vscode" \
         "$TARGET_REPO/git" \
         "$TARGET_REPO/.github" \
         "$TARGET_REPO/.vscode"

# Sync authority mirror (copy contents, not the parent folder)
echo "Updating authority mirror..."
cp -r config/prettier/* "$TARGET_REPO/config/prettier/"
cp -r config/eslint/* "$TARGET_REPO/config/eslint/"
cp -r config/vscode/* "$TARGET_REPO/config/vscode/"
cp -r git/* "$TARGET_REPO/git/"
cp -r .github/* "$TARGET_REPO/.github/"

# Sync enforcement layer
echo "Updating enforcement layer..."
cp -r config/vscode/* "$TARGET_REPO/.vscode/"

echo ""
echo "Standards sync complete."
echo ""
echo "Next steps:"
echo "  cd $TARGET_REPO"
echo "  git status"
echo "  git add config .vscode git .github"
echo '  git commit -m "chore(standards): sync baseline standards"'
