directory=/var/modep/user-files/Audio\ Recordings/
script=/usr/local/pisound/scripts/pisound-btn/recording.sh
service=/etc/systemd/system/recording.service
install:
	cp -v recording.sh $(script)
	cp -v recording.service $(service)
	chown patch:patch $(script)
	chmod g+x $(script)
	systemctl daemon-reload
	systemctl enable recording.service

remove:
	rm $(script) $(service)
