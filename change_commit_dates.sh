#!/bin/bash

# Create a backup branch first
git branch backup-main

# Define the new dates for each commit (ordered from oldest to newest)
declare -A commit_dates=(
    ["6dad723"]="2025-08-02 10:30:00 +0000"
    ["268d189"]="2025-08-05 14:20:00 +0000"
    ["b138eef"]="2025-08-08 09:15:00 +0000"
    ["39192b8"]="2025-08-12 16:45:00 +0000"
    ["10a3dc7"]="2025-08-15 11:30:00 +0000"
    ["27cd502"]="2025-08-18 13:00:00 +0000"
    ["fc8d58e"]="2025-08-21 15:30:00 +0000"
    ["5546c4d"]="2025-08-24 10:00:00 +0000"
    ["7391df3"]="2025-08-27 14:15:00 +0000"
    ["bfc0628"]="2025-08-29 16:00:00 +0000"
)

# Use filter-branch to rewrite history
git filter-branch --env-filter '
OLD_COMMIT=$(git rev-parse --short $GIT_COMMIT)

case $OLD_COMMIT in
    6dad723) export GIT_AUTHOR_DATE="2025-08-02 10:30:00 +0000"; export GIT_COMMITTER_DATE="2025-08-02 10:30:00 +0000";;
    268d189) export GIT_AUTHOR_DATE="2025-08-05 14:20:00 +0000"; export GIT_COMMITTER_DATE="2025-08-05 14:20:00 +0000";;
    b138eef) export GIT_AUTHOR_DATE="2025-08-08 09:15:00 +0000"; export GIT_COMMITTER_DATE="2025-08-08 09:15:00 +0000";;
    39192b8) export GIT_AUTHOR_DATE="2025-08-12 16:45:00 +0000"; export GIT_COMMITTER_DATE="2025-08-12 16:45:00 +0000";;
    10a3dc7) export GIT_AUTHOR_DATE="2025-08-15 11:30:00 +0000"; export GIT_COMMITTER_DATE="2025-08-15 11:30:00 +0000";;
    27cd502) export GIT_AUTHOR_DATE="2025-08-18 13:00:00 +0000"; export GIT_COMMITTER_DATE="2025-08-18 13:00:00 +0000";;
    fc8d58e) export GIT_AUTHOR_DATE="2025-08-21 15:30:00 +0000"; export GIT_COMMITTER_DATE="2025-08-21 15:30:00 +0000";;
    5546c4d) export GIT_AUTHOR_DATE="2025-08-24 10:00:00 +0000"; export GIT_COMMITTER_DATE="2025-08-24 10:00:00 +0000";;
    7391df3) export GIT_AUTHOR_DATE="2025-08-27 14:15:00 +0000"; export GIT_COMMITTER_DATE="2025-08-27 14:15:00 +0000";;
    bfc0628) export GIT_AUTHOR_DATE="2025-08-29 16:00:00 +0000"; export GIT_COMMITTER_DATE="2025-08-29 16:00:00 +0000";;
esac
' --tag-name-filter cat -- --all

echo "Commit dates have been changed successfully!"
echo "To view the new dates, run: git log --pretty=format:'%h %ad %s' --date=iso"
echo ""
echo "WARNING: This rewrites history. If you've already pushed these commits,"
echo "you'll need to force push with: git push --force origin main"
echo ""
echo "To restore the original commits, run: git reset --hard backup-main"
