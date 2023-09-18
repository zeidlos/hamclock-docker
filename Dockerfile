## PLEASE DON'T CHANGE ANYTHING IN THIS FILE UNLESS YOU'RE developing.
## REFER TO THE DOCUMENTATION FOR CONFIGURATION OF YOUR HAMCLOCK!
FROM alpine

# Configuration. Will be overwritten using the config.yaml file or docker run configuration. 
ENV CALLSIGN="AB1CDE"
ENV LOCATOR="JJ00aa"
ENV LAT="00"
ENV LONG="00"
ENV UTC_OFFSET="2"
ENV VOACAP_MODE="38"
ENV VOACAP_POWER="100"
ENV CALLSIGN_BACKGROUND_COLOR="100,100,100"
ENV CALLSIGN_BACKGROUND_RAINBOW="0"
ENV CALLSIGN_COLOR="0,0,0"
ENV FLRIG_PORT="12345"
ENV FLRIG_HOST="localhost"
ENV USE_FLRIG="0"
ENV USE_METRIC="1"

USER root
WORKDIR /hamclock
# Install prerequisites
RUN apk add curl make g++ libx11-dev openssl unzip perl

# Install Hamclock
RUN rm -fr ESPHamClock && \
    curl -O https://www.clearskyinstitute.com/ham/HamClock/ESPHamClock.zip && \
    unzip ESPHamClock.zip && \
    cd ESPHamClock && \
    make -j 4 hamclock-web-1600x960 && \
    make install

# Install Hamclock Contrib and move hceeprom to hamclock directory
RUN cd /hamclock && \
    curl -O https://www.clearskyinstitute.com/ham/HamClock/hamclock-contrib.zip && \
    unzip hamclock-contrib.zip && \
    mv hamclock-contrib/hceeprom.pl ESPHamClock/
WORKDIR /hamclock/ESPHamClock

# Run Hamclock for 15 seconds in order to create config file
RUN /usr/local/bin/hamclock -t 20 & sleep 15; kill -INT %+

# Copy runfile
WORKDIR /hamclock
COPY run.sh .
RUN chmod +x run.sh

WORKDIR /hamclock/ESPHamClock
CMD /hamclock/run.sh