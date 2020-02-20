FROM organizrtools/base-alpine
LABEL MAINTAINER="christronyxyocum"

# Install packages
RUN \
 apk add --no-cache \
  curl \
  git \
  memcached \
  openssl \
  php7-gd \
  php7-curl \
  php7-ldap \
  php7-pdo_sqlite \
  php7-sqlite3 \
  php7-session \
  php7-zip

# Add local files
COPY root/ /

# Ports and volumes
EXPOSE 80
VOLUME /config

# Container Healthcheck
HEALTHCHECK --start-period=60s CMD curl -ILfSs http://localhost:80/nginx_status > /dev/null || curl -ILfkSs https://localhost:80/status > /dev/null || exit 1