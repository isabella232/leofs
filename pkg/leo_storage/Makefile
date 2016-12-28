COMPONENT_INTERNAL=leo_storage
COMPONENT=leo_storage

include ../pkg.mk

.PHONY: build_info package package_list all bootstrap

all: package

package: prepare $(FILE).tgz

prepare:
	-rm -r $(DIR)
	cp -r $(COMPONENT_PATH) $(DIR)
	mkdir $(DIR)/share
	cp files/$(COMPONENT).xml $(DIR)/share
	cp files/start $(DIR)/erts-*/bin/start
	cp deploy/sbin/$(COMPONENT) $(DIR)/bin
	rm $(DIR)/etc/leo_storage.conf
	cp files/leo_storage.conf $(DIR)/etc/leo_storage.conf.example
	cp files/$(COMPONENT)_snmp.config.0 $(DIR)/snmp/snmpa_storage_0/$(COMPONENT)_snmp.config
	cp files/$(COMPONENT)_snmp.config.1 $(DIR)/snmp/snmpa_storage_1/$(COMPONENT)_snmp.config
	cp files/$(COMPONENT)_snmp.config.2 $(DIR)/snmp/snmpa_storage_2/$(COMPONENT)_snmp.config
	cp files/$(COMPONENT)_snmp.config.3 $(DIR)/snmp/snmpa_storage_3/$(COMPONENT)_snmp.config

clean: clean-pkg
	-rm -r $(DIR)
	-rm *.tgz
