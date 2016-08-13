CONF_DIR = ~/home/$(USER)/.winestart

.PHONY: all install uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	cp -f ./winestart.conf $(CONF_DIR)/
	cp -f ./winestart /usr/local/bin/
	
uninstall:
	rm -rf $(CONF_DIR)
	rm -f /usr/local/bin/winestart
	
safeuninstall:
	rm -f /usr/local/bin/winestart

