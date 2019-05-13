# Deployments
This script will let you setup dutodeployment your repositories by using git's post-receive script.  
It initiate a --bare repository auto setup the post-receive script into the bare repo.  

Feel free to contribute.

## Setup  
Clone this repository into your repositories(where all --bare repos will lives in) folder  
`$ git clone git@github.com:aphichat/deployments.git`

## Serverpilot  
Make sure to have the repositories folder in `/srv/users/<user>/apps/repositories`.  
Add --bare repository with post-receive script.  
`$ sh serverpilot.sh -repository <repository> -branch <staging|production>`

Add the remote to our local machine repository.  
`$ git remote add <staging|production> <user>@<host>:/srv/users/<user>/apps/repositories/<repository>.git`

Deploy using this command  
`$ git push <staging|production> <branch>`

## Other servers  
...

## Sources
- https://tinyurl.com/powxkxl

## Todos
- Add option to auto migrate databases when deployed
- Add support for more servers
- Add ability to set composer install at the post-receive script
- Add CMS specifics support
- Add type of project support (rails, react, angular, etc...)
