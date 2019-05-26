#!/bin/bash

# This script initialise the auto deployment process
# It generate and add the bare repository and add the post-receive hook file to the bare repository

REPOSITORY_PATH=$6
POST_RECEIVE_PATH="$REPOSITORY_PATH/$2.git/hooks"

if [ $1 = "-repository" ] && [ $3 = "-branch" ] && [ $5 = "-path" ]; then
  if [ ! -d "$REPOSITORY_PATH/$2.git" ]; then
    echo "REPOSITORY_PATH = $REPOSITORY_PATH"
    # initiate --bare repo
    git init --bare $REPOSITORY_PATH/$2.git
    # copy the post-receive file into the repo
    cp ./post-receive/serverpilot $POST_RECEIVE_PATH/post-receive
    # update the variables of post-receive script
    sed -i -e "s/<branch>/$4/g" -e "s/<repository>/$2/g" -e "s/<whoami>/$(whoami)/g" $POST_RECEIVE_PATH/post-receive
    # make sure <user> can excecute the post-receive file
    chmod +x $POST_RECEIVE_PATH/post-receive
  else
    echo "Error, the --bare repository allready exist."
  fi
else
  echo "Error..."
fi
