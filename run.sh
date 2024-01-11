#!/bin/sh
let OFFSET=$UTC_OFFSET*3600
perl hceeprom.pl NV_CALLSIGN $CALLSIGN && \
perl hceeprom.pl NV_DE_GRID $LOCATOR && \
perl hceeprom.pl NV_DE_LAT $LAT && \
perl hceeprom.pl NV_DE_LNG $LONG && \
perl hceeprom.pl NV_DE_TZ $OFFSET && \
perl hceeprom.pl NV_BCMODE $VOACAP_MODE && \
perl hceeprom.pl NV_BCPOWER $VOACAP_POWER && \
perl hceeprom.pl NV_CALL_BG_COLOR $CALLSIGN_BACKGROUND_COLOR && \
perl hceeprom.pl NV_CALL_BG_RAINBOW $CALLSIGN_BACKGROUND_RAINBOW && \
perl hceeprom.pl NV_CALL_FG_COLOR $CALLSIGN_COLOR && \
perl hceeprom.pl NV_FLRIGHOST $FLRIG_HOST && \
perl hceeprom.pl NV_FLRIGPORT $FLRIG_PORT && \
perl hceeprom.pl NV_FLRIGUSE $USE_FLRIG && \
perl hceeprom.pl NV_METRIC_ON $USE_METRIC && \

/usr/local/bin/hamclock -t 20
# /usr/local/bin/hamclock -t 20 & \
# curl localhost:8080 updateVersion