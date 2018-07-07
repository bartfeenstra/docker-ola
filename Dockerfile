FROM debian:9-slim

ENV TERM linux
ENV ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y ola \
    # Clean caches for a smaller build.
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY ./entry_point /entry_point
RUN chmod u+rx /entry_point
COPY ./bin/wait-for-it /wait-for-it
COPY ./ftdi.rules /etc/udev/rules.d/10-ftdi.rules

# The ola package creates an "olad" user and sets its home, but fails to create the directory.
RUN mkdir /usr/lib/olad \
    && chown olad:olad -R /usr/lib/olad \
    # Assign the "olad" user to "olad" group
    && usermod -G olad olad \
    # Allow OLA to be run by anyone in the "olad" group.
    && chown root:olad /usr/bin/olad \
    && chmod ug+rwx /usr/bin/olad

USER olad

RUN olad -f && sleep 1 \
    # Disable all OLA plugins for a clean slate, without plugin conflicts.
    && bash -c 'for pid in {1..99}; do ola_plugin_state -p $pid -s disabled &>/dev/null; done'

ENTRYPOINT ["/entry_point"]

EXPOSE 9010 9090
