FROM debian:9-slim

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y ola \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY ./ftdi.rules /etc/udev/rules.d/ftdi.rules

RUN service olad start && sleep 1 \
    # Disable all OLA plugins.
    && bash -c 'for pid in {1..99}; do ola_plugin_state -p $pid -s disabled; done'

USER olad

ENTRYPOINT ["olad", "-c", "/etc/ola"]

EXPOSE 9010 9090
