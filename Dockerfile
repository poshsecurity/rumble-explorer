##
## Sample Containerfile for running the Rumble Explorer in a container, with 
## screenshot support.
##
FROM debian:stable-slim

WORKDIR /opt/rumble

RUN apt update && \
    apt install -y chromium   # add wireless-tools if you want WiFi scanning

ADD ${AGENT_URL} rumble-explorer.bin

RUN chmod +x rumble-explorer.bin

## For full functionality the Rumble scanner needs to send and receive raw 
## packets, which requires elevated privileges. 
USER root

## The argument `manual` tells Rumble not to look for SystemD or upstart.
ENTRYPOINT [ "/opt/rumble/rumble-explorer.bin", "manual"]
