FROM ubuntu:xenial

VOLUME ["/var/cache/apt-cacher-ng"]
RUN apt-get install curl -y

EXPOSE 3142
CMD chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*