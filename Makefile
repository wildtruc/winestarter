CONF_DIR = ~/.winestart

.PHONY: all install uninstall safeuninstall

all: install

install:
	mkdir -p $(CONF_DIR)
	cp ./winestart.conf $(CONF_DIR)/
	cp ./winestart /usr/local/bin/
	
uninstall:
	rm -rf $(CONF_DIR)
	rm -f /usr/local/bin/winestart
	
safeuninstall:
	rm -f /usr/local/bin/winestart

