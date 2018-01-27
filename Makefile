# DEFINE FIRST THE CURRENT USER NAME
C_USER = $(shell ls -l "$(shell pwd)"| cut -d' ' -f3 | sed -n "2p")
INSTALL = install
GIT = /usr/bin/git
PREFIX = /usr/local
USER_DIR = /home/$(C_USER)
CONF_DIR = $(USER_DIR)/.winestarter

.PHONY: install update uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	mkdir -p $(CONF_DIR)/icons
	mkdir -p $(CONF_DIR)/configs
	mkdir -p $(CONF_DIR)/desktop
	mkdir -p $(CONF_DIR)/resources
	cp -Rf ./emblems $(CONF_DIR)/
	cp -Rf ./png $(CONF_DIR)/
	cp -f ./color.conf $(CONF_DIR)/
	cp -f ./options.list $(CONF_DIR)/resources
	cp -f ./mime-* $(CONF_DIR)/resources/
	cp -Rf ./.git $(CONF_DIR)/
	chown -R $(C_USER):$(C_USER) $(CONF_DIR)
	$(INSTALL) -D -t $(PREFIX)/bin/ winestarter
	$(INSTALL) -D -t $(PREFIX)/bin/ winestarter_conf
	$(INSTALL) -D -t $(PREFIX)/bin/ winetricks
	$(INSTALL) -D -t $(PREFIX)/bin/ update_winestarter
	$(INSTALL) -D -t $(PREFIX)/share/applications/ winestarter.desktop 
	$(INSTALL) -D -t $(PREFIX)/share/pixmaps/ png/defaults/winestarter_128.png
	$(INSTALL) -D -t $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	chown $(C_USER):$(C_USER) $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	sudo -u $(C_USER) cp -Rf ./.git $(CONF_DIR)/

update:
	sudo -u $(C_USER) git pull
	$(INSTALL) -D -t $(PREFIX)/bin/ winestarter
	$(INSTALL) -D -t $(PREFIX)/bin/ winestarter_conf
	$(INSTALL) -D -t $(PREFIX)/bin/ winetricks
	$(INSTALL) -D -t $(PREFIX)/bin/ update_winestarter
	$(INSTALL) -D -t $(PREFIX)/share/applications/ winestarter.desktop 
	$(INSTALL) -D -t $(PREFIX)/share/pixmaps/ png/defaults/winestarter_128.png
	$(INSTALL) -D -t $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	chown $(C_USER):$(C_USER) $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	sudo -u $(C_USER) cp -Rf ./.git $(CONF_DIR)/
	sh ./changelog.sh
		
uninstall:
	rm -Rf $(CONF_DIR)
	rm -f /usr/local/bin/winestarter
	rm -f /usr/local/bin/winestarter_conf
	rm -f /usr/local/bin/update_winestarter
	rm -f /usr/local/share/applications/winestarter.desktop
	rm -f /usr/local/share/pixmaps/winestarter_128.png
	rm -f $(USER_DIR)/.config/autostart/update_winestarter.desktop
	
safeuninstall:
	rm -f /usr/local/bin/winestarter
	rm -f /usr/local/bin/winestarter_conf
	rm -f /usr/local/bin/update_winestarter
	rm -f /usr/local/share/applications/winestarter.desktop
	rm -f /usr/local/share/pixmaps/winestarter_128.png
	rm -f $(USER_DIR)/.config/autostart/update_winestarter.desktop
