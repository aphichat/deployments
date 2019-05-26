#!/bin/bash

# This script initialise the auto deployment process
# It generate and add the bare repository and add the post-receive hook file to the bare repository

POST_RECEIVE_PATH="../$2.git/hooks"

echo "----"
echo "WHOAMI: $(whoami)"
echo "REPOSITORY: $2"
echo "BRANCH: $4"
echo "WORK_TREE: $6"
echo "POST_RECEIVE_PATH: $POST_RECEIVE_PATH"
echo "----"

if [ $1 = "-repository" ] && [ $3 = "-branch" ] && [ $5 = "-path" ]; then
  if [ ! -d "../$2.git" ]; then
    echo "Initiate --bare repo"
    git init --bare ../$2.git
    echo "Copy the post-receive file into the repo"
    cp ./post-receive/serverpilot $POST_RECEIVE_PATH/post-receive
    echo "Substitude the variables of post-receive script"
    sed -i -e "s/<branch>/$4/g" -e "s/<repository>/$2/g" -e "s/<whoami>/$(whoami)/g" -e "s/<work_tree>/$6/g" $POST_RECEIVE_PATH/post-receive
    echo "Make sure <user> can excecute the post-receive file"
    chmod +x $POST_RECEIVE_PATH/post-receive
  else
    echo "Error, the --bare repository allready exist."
  fi
else
  echo "Error..."
fi
