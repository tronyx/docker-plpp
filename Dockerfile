FROM lsiobase/nginx:3.10
LABEL MAINTAINER=christronyxyocum

# Install packages
RUN \
 apk add --no-cache \
  curl \
  memcached \
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
