#!/bin/sh

. /usr/local/pisound/scripts/common/common.sh

if [ ! -e "/tmp/.recordingState" ]; then 
	periodic_led_blink 3 1
	touch /tmp/.recordingState
	oscsend localhost 7777 /jack_capture/tm/start
else
	periodic_led_blink 3 0.5
	oscsend localhost 7777 /jack_capture/tm/stop
	rm -rf /tmp/.recordingState
	periodic_led_blink 0 0 
fi
