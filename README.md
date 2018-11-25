A Docker image for [PHP Library Presenter for PLEX](https://github.com/Tensai75/plpp) using the `lsiobase/alpine.nginx:3.8` base image.

# tronyx/docker-plpp

Feel free to submit Pull Requests and report any Issues that you may have found.

## PLPP

Provides a PHP front end to simply present PLEX libraries on the web without the possibility to play or download the library items. Currently movie/home video, TV show, music and photo/picture libraries are supported.

## Usage

```
docker create \
  --name plpp \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 80:80 \
  tronyx/docker-plpp
```

Then start the container with:

```
docker start plpp
```

For Docker-Compose you can use something similar to the below:

```
plpp:
  container_name: plpp
  image: tronyx/docker-plpp
  hostname: plpp
  restart: on-failure
  volumes:
    - "/home/plpp/config/:/config"
  ports:
    - "8383:80"
```

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container. So `-p 8080:80` would expose port 80 from inside the container to be accessible from the host's IP on port 8080 and `http://192.168.x.x:8080` would show you what's running INSIDE the container on port 80.

* `-p 80` - The port(s)
* `-v /config` - Mapping the config files for PLPP
* `-e PGID` Used for GroupID - see below for explanation
* `-e PUID` Used for UserID - see below for explanation

It is based on Alpine Linux with an s6 overlay.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

Point your web browser to `DOCKER-HOST-IP:PLPP-PORT/settings.php`, IE: `http://192.168.x.x:8080/settings.php` and you will first be prompted to set the password for the settings section. Once you're done that you can login and configure the settings.

## Info

* Shell access whilst the container is running: `docker exec -it plpp /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f plpp`
* Container version number: `docker inspect -f '{{ index .Config.Labels "build_version" }}' plpp`
* Image version number: `docker inspect -f '{{ index .Config.Labels "build_version" }}' tronyx/docker-plpp`
