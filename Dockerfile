FROM ahri/base

RUN apt-get update -qq && \
    apt-get -qqy install transmission-daemon && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 9091

RUN mkdir -p /etc/service/transmission
ADD transmission.sh /etc/service/transmission/run

VOLUME ["/torrent/download", "/torrent/watch"]
RUN chown docker-user:docker-group /torrent/download
RUN chown docker-user:docker-group /torrent/watch

RUN mkdir -p /home/docker-user/.config/transmission-daemon
ADD settings.json /home/docker-user/.config/transmission-daemon/
RUN chown -R docker-user:docker-group /home/docker-user

CMD ["/sbin/my_init"]
