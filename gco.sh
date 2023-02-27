#!/bin/bash

# Get the search terms from the command line arguments
search_terms=("$@")

# Combine the search terms into a single regex pattern
search_pattern=$(printf ".*%s" "${search_terms[@]}" | sed 's/^.//')

# Get a list of all local branches matching the search pattern
branch_list=$(git branch --list | grep -E "$search_pattern")

# Count the number of branches matching the search pattern
branch_count=$(echo "$branch_list" | wc -l)

# If there is only one branch matching the search pattern, checkout to it
if [ "$branch_count" -eq 1 ]; then
  branch_name=$(echo "$branch_list" | tr -d '*' | xargs)
  echo "Checking out to branch $branch_name"
  git checkout "$branch_name"
# If there are multiple branches matching the search pattern, prompt the user to select one
elif [ "$branch_count" -gt 1 ]; then
  echo "Multiple branches matching '$search_pattern':"
  # Use awk to add numbers to the branch list
  numbered_branch_list=$(echo "$branch_list" | awk '{print NR-1, $0}')
  echo "$numbered_branch_list"
  echo "Enter the number of the branch you want to switch to:"
  read branch_number
  # Use awk to extract the branch name from the selected number
  branch_name=$(echo "$numbered_branch_list" | awk -v n="$branch_number" '$1==n {print $2}' | tr -d '*')
  if [ -n "$branch_name" ]; then
    echo "Checking out to branch $branch_name"
    git checkout "$branch_name"
  else
    echo "Invalid branch number"
  fi
else
  echo "No branches matching '$search_pattern' found"
fi
