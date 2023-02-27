# gco
Search for branch name while checking out to it

# description

This is a bash script that helps Git users checkout to a local branch by searching for a branch name containing one or more search terms. The script takes any number of search terms as command line arguments, and uses them to search for local branches that match all of the search terms. If there is only one matching branch, the script automatically checks it out. If there are multiple matching branches, the script displays a numbered list of the branches and prompts the user to select one by number. If there are no matching branches, the script displays a message indicating that no branches were found. This script is useful for Git users who have many branches and want an easy way to switch to a specific branch without having to remember its exact name.

# installation

- clone repository or download gco.sh file directly
- run `chmod +x gco.sh` on the file
- move the file to the PATH eg `sudo cp gco.sh /usr/local/bin/gco`

# usage

`gco {foo bar}` - this will look for branches with `foo` and `bar` in the name and will checkout the branch with both terms if there is only one usch branch. If it find more than one, it will prompt to choose which exactly it should checkout to.
