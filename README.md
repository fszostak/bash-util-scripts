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

2) Add to scripts directory to your $PATH

```
$ echo 'export PATH=$PATH:~/scripts' >> ~/.bash_profile
```

3) Reopen your terminal and try use any script


## Utilities
- [backup - make fast and clean backup from your local source code](https://github.com/fszostak/bash-util-scripts/blob/master/docs/backup.md).
- [img-optimize - optimize your JPG and PNG image files](https://github.com/fszostak/bash-util-scripts/blob/master/docs/optimize.md).

## Docker
- [docker-exec - access your container shell quickly](https://github.com/fszostak/bash-util-scripts/blob/master/docs/docker.md).

## AWS
- [ecs-stop-task - stop task from ECS FARGATE Cluster](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ecs-stop-task.md).
- [ecs-get-ip - get public IP from ECS FARGATE Task](https://github.com/fszostak/bash-util-scripts/blob/master/docs/ecs-get-ip.md).
