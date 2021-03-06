# bash-util-scripts

bash scripts to make your work easier.

Instruction

1) Clone the repository in your Workspaces directory.

```
$ mkdir ~/Workspaces
$ cd ~/Workspaces
$ git clone https://github.com/fszostak/bash-util-scripts
$ ln -s ~/Workspaces/bash-util-scripts/src ~/scripts
```

2) Add scripts directory to your $PATH

```
# for zsh
$ echo -n "\n\nexport PATH=$PATH:~/scripts" >> ~/.zshrc

# for bash
$ echo -n "\n\nexport PATH=$PATH:~/scripts" >> ~/.bash_profile
```

3) Reopen your terminal and try use any script

> Note: all commands have -h option for help

## RUN WITH DOCKER

```
docker run fszostak/bash-util-scripts bash

docker run -v "$(pwd)/images:/images" fszostak/bash-util-scripts bash -c "~/scripts/img-optimize /images"
```


## SSH
- [ssh-plus - ssh connection menu from your ~/.ssh/config TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ssh.md).
- [ssh-keygen-generate - generate RSA keys TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ssh.md).
- [ssh-remove-known-host - remove IP from know_hosts TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ssh.md).

## Utilities
- [backup - make fast and clean .tar.gz backup from your local source code](https://github.com/fszostak/bash-util-scripts/blob/master/docs/backup.md).
- [img-optimize - optimize your JPG and PNG image files](https://github.com/fszostak/bash-util-scripts/blob/master/docs/optimize.md).
- [now - show weather, calendar and time TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/now.md).
- [npm-modules-version - read node_modules directory and extract installed packages version TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/npm-modules-version.md).
- [listen - show listen ports TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/listen.md).
- [openssl-self-signed-certificate - generate HTTPS self signed certificate TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/openssl-self-signed-certificate.md).
- [sync-dir - syncronize files and directories from source to destination TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/sync-dir.md).

## Docker
- [docker-exec - running containers menu for shell access TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/docker.md).
- [docker-kill - running containers menu for kill TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/docker.md).
- [docker-cleanup - clean up your Docker environment TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/docker.md).

## AWS
- [ec2 - ssh connection menu from your AWS instances TODO](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ec2.md).
- [ecs-get-ip - get public IP from ECS FARGATE Task](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ecs-get-ip.md).
- [ecs-stop-task - stop task from ECS FARGATE Cluster](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ecs-stop-task.md).
