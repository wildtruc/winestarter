CONF_DIR = ~/home/$(USER)/.winestarter

.PHONY: all install uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	mkdir -p $(CONF_DIR)/{icons,configs,desktop}
#	cp -f ./winestarter.conf $(CONF_DIR)/
	cp -Rf ./emblems $(CONF_DIR)/
	cp -Rf ./png $(CONF_DIR)/
	cp -f ./winestarter /usr/local/bin/
	cp -f ./winestarter_conf /usr/local/bin/
	
uninstall:
	rm -Rf $(CONF_DIR)
	rm -f /usr/local/bin/winestarter
	rm -f /usr/local/bin/winestarter_conf
	
safeuninstall:
	rm -f /usr/local/bin/winestarter
	rm -f /usr/local/bin/winestarter_conf

