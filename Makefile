CONF_DIR = /home/$(USER)/.winestarter

.PHONY: all install uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	mkdir -p $(CONF_DIR)/{icons,configs,desktop}
	mkdir -p /usr/local/share/{applications,pixmaps}
#	cp -f ./winestarter.conf $(CONF_DIR)/
	cp -Rf ./emblems $(CONF_DIR)/
	cp -Rf ./png $(CONF_DIR)/
	cp -f ./winestarter /usr/local/bin/
	cp -f ./winestarter_conf /usr/local/bin/
	cp -f ./winestarter.desktop /usr/local/share/applications/
	cp -f ./png/defaults/winestarter_128.png /usr/local/share/pixmaps/
	
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

