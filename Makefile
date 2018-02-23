# DEFINE FIRST THE CURRENT USER NAME
C_USER = $(shell ls -l "$(shell pwd)"| cut -d' ' -f3 | sed -n "2p")
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
	mkdir -p $(CONF_DIR)/png/defaults
	cp -Rf ./emblems $(CONF_DIR)/
	cp -Rf ./png/defaults/* $(CONF_DIR)/png/defaults/
	cp -f ./color.conf $(CONF_DIR)/
	cp -f ./options.list $(CONF_DIR)/resources
	cp -f ./mime-* $(CONF_DIR)/resources/
	cp -Rf ./.git $(CONF_DIR)/
	chown -R $(C_USER):$(C_USER) $(CONF_DIR)
	install -Dm755 -t $(PREFIX)/bin/ winestarter
	install -Dm755 -t $(PREFIX)/bin/ winestarter_conf
	install -Dm755 -t $(PREFIX)/bin/ winestarter_kill
	install -Dm755 -t $(PREFIX)/bin/ winetricks
	install -Dm755 -t $(PREFIX)/bin/ update_winestarter
	install -Dm644 -t $(PREFIX)/share/applications/ winestarter.desktop
	install -Dm644 -t $(PREFIX)/share/pixmaps/ png/defaults/winestarter_128.png
	install -Dm644 -t $(PREFIX)/share/pixmaps/ png/defaults/wine48w.png
	install -Dm644 -t /usr/share/polkit-1/actions/ com.github.pkexec.winestarter_wipe.policy
	install -Dm644 -t $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	chown $(C_USER):$(C_USER) $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	sudo -u $(C_USER) cp -Rf ./.git $(CONF_DIR)/

update:
	sudo -u $(C_USER) git pull
	install -Dm755 -t $(PREFIX)/bin/ winestarter
	install -Dm755 -t $(PREFIX)/bin/ winestarter_conf
	install -Dm755 -t $(PREFIX)/bin/ winestarter_kill
	install -Dm755 -t $(PREFIX)/bin/ winetricks
	install -Dm755 -t $(PREFIX)/bin/ update_winestarter
	install -Dm644 -t $(PREFIX)/share/applications/ winestarter.desktop 
	install -Dm644 -t $(PREFIX)/share/pixmaps/ png/defaults/winestarter_128.png
	install -Dm644 -t $(PREFIX)/share/pixmaps/ png/defaults/wine48w.png
	install -Dm644 -t /usr/share/polkit-1/actions/ com.github.pkexec.winestarter_wipe.policy
	install -Dm644 -t $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	cp -Ru ./png/defaults/* $(CONF_DIR)/png/defaults/
	chown $(C_USER):$(C_USER) $(USER_DIR)/.config/autostart/ update_winestarter.desktop
	sudo -u $(C_USER) cp -Rf ./.git $(CONF_DIR)/
	sh ./changelog.sh
		
uninstall:
	rm -Rf $(CONF_DIR)
	rm -f $(PREFIX)/bin/winestarter
	rm -f $(PREFIX)/bin/winestarter_conf
	rm -f $(PREFIX)/bin/update_winestarter
	rm -f $(PREFIX)/share/applications/winestarter.desktop
	rm -f $(PREFIX)/share/pixmaps/winestarter_128.png
	rm -f $(PREFIX)/share/pixmaps/wine48w.png
	rm -f /usr/share/polkit-1/actions/com.github.pkexec.winestarter_wipe.policy
	rm -f $(USER_DIR)/.config/autostart/update_winestarter.desktop
	
safeuninstall:
	rm -f $(PREFIX)/bin/winestarter
	rm -f $(PREFIX)/bin/winestarter_conf
	rm -f $(PREFIX)/bin/update_winestarter
	rm -f $(PREFIX)/share/applications/winestarter.desktop
	rm -f $(PREFIX)/share/pixmaps/winestarter_128.png
	rm -f /usr/share/polkit-1/actions/com.github.pkexec.winestarter_cache.policy
	rm -f $(USER_DIR)/.config/autostart/update_winestarter.desktop
