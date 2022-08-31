#!/bin/bash

# Set the number of commits to backdate
num_commits=500

# Loop through each commit
for ((i=1; i<=$num_commits; i++)); do
  # Get the latest commit hash
  commit=$(git log -1 --format=%H)

  # Generate a random date within the past 365 days
  random_date=$(date -d "$((RANDOM % 730)) days ago" "+%Y-%m-%dT%H:%M:%S")

  # Backdate the commit
  GIT_COMMITTER_DATE="$random_date" git commit --amend --no-edit --date "$random_date" --author "LIPS-PLAY <felipeviana2016@hotmail.com>"

  # Force-push the updated commit history
  git push --force-with-lease origin main
done
