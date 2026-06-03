#!/usr/bin/env bash
# Quick-update: stage everything, commit, push. Vercel auto-deploys.
#
# Usage:
#   ./update.sh                       # default message: "Content update YYYY-MM-DD"
#   ./update.sh "Fixed typo on cover" # custom message

set -euo pipefail
cd "$(dirname "$0")"

# Nothing to commit?
if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to push."
  exit 0
fi

git add .
git commit -m "${1:-Content update $(date +%Y-%m-%d)}"
git push

echo
echo "✅ Pushed to GitHub. Vercel will redeploy in ~20-30s."
echo "   Track: https://vercel.com/dashboard"
