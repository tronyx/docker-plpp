FROM lsiobase/alpine.nginx:3.8
MAINTAINER christronyxyocum

# Set version label
ARG BUILD_DATE
ARG VERSION

# Add local files
COPY root/ /

# Ports and volumes
EXPOSE 80
VOLUME /config
