include ../../leofs.mk
VERSION=$(LEOFS_VERSION)
PKG_CATEGORY=leofs
PKG_HOMEPAGE=https://leo-project.net/leofs/
DEPS="erlang>=18.0.0"
TARGET_DIR=/opt/local
COMPONENT_PATH=../../package/$(COMPONENT_INTERNAL)
DIR=$(STAGE_DIR)/$(COMPONENT)
include ../../deps/fifo_utils/priv/pkg.mk
