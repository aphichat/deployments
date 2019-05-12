#!/bin/bash

REPOSITORY_PATH="/srv/users/$(whoami)/apps/repositories"

if [ $1 = "-repository" ] && [ $3 = "-branch" ]; then
  if [ ! -d "$REPOSITORY_PATH/$2.git" ]; then
    # initiate --bare repo
    git init --bare $REPOSITORY_PATH/$2.git
    # copy the post-receive file into the repo
    cp ./post-receive/serverpilot $REPOSITORY_PATH/$2.git/hooks/post-receive
    # update the variables of post-receive script
    sed -i '' -e "s/<branch>/$4/g" -e "s/<repository>/$2/g" -e "s/<whoami>/$(whoami)/g" $REPOSITORY_PATH/$2.git/hooks/post-receive
  else
    echo "Error, the --bare repository allready exist."
  fi
else
  echo "Error..."
fi
