# bash-util-scripts


## backup.sh

Backup file ("tar.gz") generator from specified source directories, work directories and files are excluded.
```
$ backup.sh source_dir1 [source_dir2 ...]
```

* Note: Exclude .DS_Store, .git/, node_modules/, build/, cache/, *.bak, *.swp

## docker.sh

Shortcut to "docker exec -it instanceid /bin/bash".

Example:

```
fszostak@localhost [~/Workspaces/adminpro/.docker]
(master)$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                    NAMES
12a545097af0        docker_adminpro         "/bin/sh -c '/bin/ch…"   4 minutes ago       Up 4 minutes        0.0.0.0:80->80/tcp       docker_adminpro_1
40616f3556c3        docker_adminpro-mysql   "docker-entrypoint.s…"   4 minutes ago       Up 4 minutes        0.0.0.0:3306->3306/tcp   docker_adminpro-mysql_1
fszostak@localhost [~/Workspaces/adminpro/.docker]
(master)$ docker.sh adminpro
12a545097af0 docker_adminpro "/bin/sh -c '/bin/ch…" 4 minutes ago Up 4 minutes 0.0.0.0:80->80/tcp docker_adminpro_1
root@12a545097af0:/# exit
exit
fszostak@localhost [~/Workspaces/adminpro/.docker]
(master)$ docker.sh mysql
40616f3556c3 docker_adminpro-mysql "docker-entrypoint.s…" 5 minutes ago Up 5 minutes 0.0.0.0:3306->3306/tcp docker_adminpro-mysql_1
root@40616f3556c3:/# exit
```

## optimize.sh

Automated script for recursively web image files optimization.

```
$ optimize.sh source_dir
```

### Requirements
Install jpegoptim and pngquant

On MacOS:

Install brew: 
```
sudo /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install jpegoptim and pngquant: 
```
brew install jpegoptim pngquant
```
 
Add scripts to your PATH: 
```
echo "export PATH=$PATH:~/bash-util-scripts/src" >> ~/.bash_profile
```
