## Serverpilot  
Make sure to have the repositories folder in `/srv/users/<user>/apps/repositories`.

Clone this repository into your repositories folder  
`$ git clone git@github.com:aphichat/deployments.git /srv/users/<user>/apps/repositories`

Use this command when theres no --bare repo on the staging|production server.  
`$ sh serverpilot.sh -repository <repository> -branch <staging|production>`

Now we want to add the remote to our local repo to do git push <staging|master>  
`$ git remote add <staging|production> <user>@<host>:/srv/users/<user>/apps/repositories/<repository>.git`

All setup, deploy using this command  
`$ git push <staging|production> <branch>`

## Other server  
...

## Sources
- https://tinyurl.com/powxkxl

## Todos
- Add option to auto migrate databases when deployed
- Add support for more servers