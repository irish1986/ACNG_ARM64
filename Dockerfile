FROM ubuntu:focal
LABEL maintainer="Irish1986@Github"

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends \
         apt-cacher-ng \
    && echo "Cleaning up" \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

VOLUME ["/var/cache/apt-cacher-ng"]

EXPOSE 3142
CMD chmod 777 /var/cache/apt-cacher-ng && \
    /etc/init.d/apt-cacher-ng start && \
    tail -f /var/log/apt-cacher-ng/*