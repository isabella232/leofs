COMPONENT_INTERNAL=leo_manager
COMPONENT=leo_manager

include ../pkg.mk

.PHONY: build_info package package_list all bootstrap

all: package

package: prepare $(FILE).tgz

prepare:
	-rm -r $(DIR) || true
	cp -r $(COMPONENT_PATH) $(DIR)
	mkdir $(DIR)/share
	cp ../../leofs-adm $(STAGE_DIR)/sbin
	cp files/$(COMPONENT).xml $(DIR)/share
	cp files/start $(DIR)/erts-*/bin/start
	rm $(DIR)/etc/leo_manager.conf || true
	cp files/leo_manager.conf.master $(DIR)/etc/leo_manager.conf.example
	cp files/leo_manager_snmp.config $(DIR)/snmp/snmpa_manager_0/
	cp files/leo_manager_snmp.config $(DIR)/snmp/snmpa_manager_1/

clean: clean-pkg
	-rm $(STAGE_DIR)/sbin/leofs-adm
	-rm -r $(DIR)
	-rm *.tgz
