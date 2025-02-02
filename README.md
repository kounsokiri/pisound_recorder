# About

One Button Recording with Buffer, with Raspberry/PatchboxOS and Pisound.

Tap The Button once to record the past 3 minutes, tap again to stop

## Core
- recording.sh: Wrapper for Pisound Button
	- Handles starting and stopping of recording
	- Blinks the led during recording
- recording.service: SystemD unit for recording
	- Uses /home/patch/Music/ directory
	- jack_capture timemachine/osc daemon logic
	- captures 180 seconds (3 minutes) of buffer before you pushed the button (configurable, if you change `--tmpb 180` in the service file)

# Usage
- Install (see below)
- Press button to start recording, including the past 3 minutes, led starts blinking
- Press button to stop recording, blinking intensivies when done
- View files in  /home/patch/Music/
  
# Debugging
- `watch systemctl status recording.service`
- `journalctl -f -u recording.service`

# Requirements
- Patchbox OS (Tested with Debian 12 (bookworm))
- Raspberry Pi (Tested with 5 - 8GB)
- Pisound, optionally with case

# Install

```
    sudo apt install jack_capture liblo-tools
    sudo make install
    sudo sed -i 's:^\(CLICK_1[[:space:]]\+\).*$:\1/usr/local/pisound/scripts/pisound-btn/recording.sh:' /etc/pisound.conf
```

or edit /etc/pisound.conf manually to contain:
	
```
    CLICK_1 /usr/local/pisound/scripts/pisound-btn/recording.sh`
```

# Remove

`sudo make remove`

# Thanks

Original made by [strobeflash](https://github.com/strobeflash/pisound_recorder) & [Giedrius][11], for [PatchboxOS](https://blokas.io/patchbox-os/)/[Pisound](https://blokas.io/pisound/)


[10]: https://wiki.mod.audio/wiki/File_handling#:~:text=The%20Audio%20Recordings%20folder%20will%20be%20the%20place%20where%20any%20recording%20done%20inside%20your%20MOD%20device%20is%20stored.
[11]: https://community.blokas.io/t/record-audio-with-the-button/2761/13
