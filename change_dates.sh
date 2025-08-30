#!/bin/bash

# Array of commits to modify (in reverse order for rebase)
commits=(
    "6dad723"
    "268d189" 
    "b138eef"
    "39192b8"
    "10a3dc7"
    "27cd502"
    "fc8d58e"
    "5546c4d"
    "7391df3"
    "bfc0628"
)

# Corresponding dates in August 2025 (distributed across the month)
dates=(
    "2025-08-02 10:30:00"
    "2025-08-05 14:20:00"
    "2025-08-08 09:15:00"
    "2025-08-12 16:45:00"
    "2025-08-15 11:30:00"
    "2025-08-18 13:00:00"
    "2025-08-21 15:30:00"
    "2025-08-24 10:00:00"
    "2025-08-27 14:15:00"
    "2025-08-29 16:00:00"
)

# Start from the earliest commit
git rebase -i 6dad723^ --committer-date-is-author-date

echo "Please manually replace 'pick' with 'edit' for all commits in the editor that opens."
echo "After saving and closing the editor, run the following commands for each commit:"
echo ""
for i in {0..9}; do
    echo "# For commit ${commits[$i]}:"
    echo "GIT_COMMITTER_DATE=\"${dates[$i]}\" git commit --amend --no-edit --date=\"${dates[$i]}\""
    echo "git rebase --continue"
    echo ""
done
