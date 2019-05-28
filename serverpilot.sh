#!/bin/bash

# This script initialise the auto deployment process
# It generate and add the bare repository and add the post-receive hook file to the bare repository

GIT_DIR=$(printf "%s" "$2"|sed 's/\\//g')
POST_RECEIVE_PATH="$GIT_DIR.git/hooks"

echo "----"
echo "WHOAMI: $(whoami)"
echo "REPOSITORY: $8"
echo "BRANCH: $4"
echo "GIT_DIR: $2"
echo "GIT_DIR CLEANED: $GIT_DIR"
echo "WORK_TREE: $6"
echo "POST_RECEIVE_PATH: $POST_RECEIVE_PATH"
echo "----"

if [ $1 = "-git_dir" ] && [ $3 = "-branch" ] && [ $5 = "-path" ] && [ $7 = "-repository" ]; then
  if [ ! -d "$GIT_DIR.git" ]; then
    echo "Initiate --bare repo $GIT_DIR.git"
    git init --bare $GIT_DIR.git
    echo "Copy the post-receive file into the repo"
    cp ./post-receive/serverpilot $POST_RECEIVE_PATH/post-receive
    echo "Substitude the variables of post-receive script"
    sed -i -e "s/<branch>/$4/g" -e "s/<git_dir>/$2/g" -e "s/<whoami>/$(whoami)/g" -e "s/<work_tree>/$6/g" $POST_RECEIVE_PATH/post-receive
    echo "Make sure <user> can excecute the post-receive file"
    chmod +x $POST_RECEIVE_PATH/post-receive
  else
    echo "The --bare repository $GIT_DIR.git already exist."
  fi
else
  echo "Error..."
fi
