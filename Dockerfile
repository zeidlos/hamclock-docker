FROM alpine
USER root
WORKDIR /hamclock
COPY run.sh .
RUN chmod +x run.sh
RUN ls /hamclock
RUN apk add curl make g++ libx11-dev openssl unzip
RUN rm -fr ESPHamClock && \
    curl -O https://www.clearskyinstitute.com/ham/HamClock/ESPHamClock.zip && \
    unzip ESPHamClock.zip && \
    cd ESPHamClock && \
    make -j 4 hamclock-web-1600x960 && \
    make install
RUN ls /hamclock
CMD /hamclock/run.sh