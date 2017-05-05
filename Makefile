C_USER = $(shell ls -l "$(shell pwd)"| cut -d' ' -f3 | sed -n "2p")
CONF_DIR = /home/$(C_USER)/.winestarter

.PHONY: all install uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	mkdir -p $(CONF_DIR)/icons
	mkdir -p $(CONF_DIR)/configs
	mkdir -p $(CONF_DIR)/desktop
	mkdir -p /usr/local/share/applications
	mkdir -p /usr/local/share/pixmaps
#	cp -f ./winestarter.conf $(CONF_DIR)/
	cp -Rf ./emblems $(CONF_DIR)/
	cp -Rf ./png $(CONF_DIR)/
	cp -f ./winestarter /usr/local/bin/
	cp -f ./winestarter_conf /usr/local/bin/
	cp -f ./winestarter.desktop /usr/local/share/applications/
	cp -f ./png/defaults/winestarter_128.png /usr/local/share/pixmaps/
	chown -R $(C_USER):$(C_USER) $(CONF_DIR)
	
uninstall:
	rm -Rf $(CONF_DIR)
	rm -f /usr/local/bin/winestarter
	rm -f /usr/local/bin/winestarter_conf
	rm -f /usr/local/share/applications/winestarter.desktop
	rm -f /usr/local/share/pixmaps/winestarter_128.png
	
safeuninstall:
	rm -f /usr/local/bin/winestarter
	rm -f /usr/local/bin/winestarter_conf
	rm -f /usr/local/share/applications/winestarter.desktop
	rm -f /usr/local/share/pixmaps/winestarter_128.png

