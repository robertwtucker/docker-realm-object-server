FROM ubuntu:16.04
MAINTAINER Robert Tucker <robertwtucker@gmail.com>

# Install curl
RUN apt-get update \
  && apt-get -y install curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup Realm's PackageCloud repository
RUN curl -s https://packagecloud.io/install/repositories/realm/realm/script.deb.sh | bash

# Update the repository and install Realm
RUN apt-get update \
  && apt-get -y install realm-object-server-developer \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /var/lib/realm/object-server
EXPOSE 9080

CMD /usr/bin/realm-object-server -c /etc/realm/configuration.yml
