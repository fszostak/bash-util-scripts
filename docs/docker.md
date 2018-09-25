# bash-util-scripts

## docker.sh

Shortcut to "docker exec -it instanceid /bin/bash".

Example:

```bash
$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                    NAMES
12a545097af0        docker_adminpro         "/bin/sh -c '/bin/ch…"   4 minutes ago       Up 4 minutes        0.0.0.0:80->80/tcp       docker_adminpro_1
40616f3556c3        docker_adminpro-mysql   "docker-entrypoint.s…"   4 minutes ago       Up 4 minutes        0.0.0.0:3306->3306/tcp   docker_adminpro-mysql_1

$ docker.sh adminpro
12a545097af0 docker_adminpro "/bin/sh -c '/bin/ch…" 4 minutes ago Up 4 minutes 0.0.0.0:80->80/tcp docker_adminpro_1
root@12a545097af0:/# exit
exit

$ docker.sh mysql
40616f3556c3 docker_adminpro-mysql "docker-entrypoint.s…" 5 minutes ago Up 5 minutes 0.0.0.0:3306->3306/tcp docker_adminpro-mysql_1
root@40616f3556c3:/# exit
```

Source: [docker.sh](https://github.com/fszostak/bash-util-scripts/blob/master/src/docker.sh)
