CONF_DIR = ~/home/$(USER)/.winestarter

.PHONY: all install uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	mkdir -p $(CONF_DIR)/{icons,configs}
	cp -f ./winestarter.conf $(CONF_DIR)/
	cp -Rf ./emblem $(CONF_DIR)/
	cp -Rf ./png $(CONF_DIR)/
	cp -f ./winestarter /usr/local/bin/
	
uninstall:
	rm -rf $(CONF_DIR)
	rm -f /usr/local/bin/winestarter
	
safeuninstall:
	rm -f /usr/local/bin/winestarter

