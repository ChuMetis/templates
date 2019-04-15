export SHELL=/bin/bash

#
# https://www.kernel.org/
# ==============================
#
include linux-3.18.109.config

qstrip=$(strip $(subst ",,$(1)))
 
LINUX_PKG_DIR := $(call qstrip,$(CONFIG_BUILD_PKG_FILE))
LINUX_PKG_DIR := $(notdir $(LINUX_PKG_DIR))
LINUX_PKG_DIR  := $(LINUX_PKG_DIR:%.tar.bz2=%)
LINUX_PKG_DIR  := $(LINUX_PKG_DIR:%.tar.xz=%)
LINUX_PKG_DIR  := $(LINUX_PKG_DIR:%.tar.gz=%)

LINUX_PKG_TXZ := $(LINUX_PKG_DIR).tar.xz
LINUX_SUM_ASC := sha256sums.asc 
LINUX_PKG_URL := $(call qstrip,$(CONFIG_BUILD_PKG_URL))
LINUX_BUILD_OUTDIR := $(call qstrip,$(CONFIG_BUILD_OUTDIR))
LINUX_BUILD_ARCH   := $(call qstrip,$(CONFIG_BUILD_ARCH))
LINUX_BUILD_CROSS  :=
LINUX_BUILD_CONFIG := $(call qstrip,$(CONFIG_BUILD_CFG_FILE))

all:
PHONY += required
required:
	-sudo apt-get install qemu
	-sudo apt-get install libelf-dev
	-sudo apt-get install libelf-devel
	-sudo apt-get install elfutils-libelf-devel

PHONY += all menuconfig
all menuconfig:$(LINUX_BUILD_OUTDIR)/.config
	make -C $(dir $<) ARCH=$(LINUX_BUILD_ARCH) CROSS_COMPILE=$(LINUX_BUILD_CROSS) O=$(abspath $(LINUX_PKG_DIR)) $@ -j8


ifneq ($(wildcard $(LINUX_BUILD_CONFIG)),)
LINUX_BUILD_CONFIG := $(wildcard $(LINUX_BUILD_CONFIG))
LINUX_BUILD_CONFIG := $(abspath $(LINUX_BUILD_CONFIG))
endif


$(LINUX_BUILD_OUTDIR)/.config:$(LINUX_PKG_DIR)
	@mkdir -p $(dir $@)
ifeq ($(wildcard $(LINUX_BUILD_CONFIG)),)
	make -C $< ARCH=$(LINUX_BUILD_ARCH) CROSS_COMPILE=$(LINUX_BUILD_CROSS) O=$(abspath $(dir $@)) $(LINUX_BUILD_CONFIG)
	echo "CONFIG_GDB_SCRIPTS=y" >> $@
	echo "CONFIG_DEBUG_INFO=y" >> $@
#	echo "CONFIG_DEBUG_INFO_DWARF4=y" >> $@
else
	make -C $< ARCH=$(LINUX_BUILD_ARCH) CROSS_COMPILE=$(LINUX_BUILD_CROSS) O=$(abspath $(dir $@)) KCONFIG_ALLCONFIG=$(LINUX_BUILD_CONFIG) allnoconfig
#	cp -fv $(LINUX_BUILD_CONFIG) $@
endif


$(LINUX_PKG_DIR):dl/$(LINUX_PKG_DIR).tar.xz
	if [ ! -d "$@" ]; then tar xf $<; fi
#	tar xf $<


dl/$(LINUX_PKG_DIR).tar.xz:
	mkdir -p $(dir $@)
	cd $(dir $@); \
	while true;\
	do \
	  if [ ! -f $(LINUX_SUM_ASC) ]; then wget $(LINUX_PKG_URL)/$(LINUX_SUM_ASC); fi; \
	  if [ ! -f $(LINUX_PKG_TXZ) ]; then wget $(LINUX_PKG_URL)/$(LINUX_PKG_TXZ); fi; \
	  grep "`sha256sum $(LINUX_PKG_TXZ)`" $(LINUX_SUM_ASC);\
	  if [ $$? -eq 0 ]; then \
	    echo "Download $(LINUX_PKG_TXZ) success."; break;\
	  else \
	    echo "Download $(LINUX_PKG_TXZ) fail.";\
	    rm -f $(LINUX_SUM_ASC) $(LINUX_PKG_TXZ); \
	  fi; \
	done

PHONY += clean
clean:
	rm -fr $(LINUX_PKG_DIR) $(LINUX_BUILD_OUTDIR)

PHONY += distclean
distclean:clean
	rm -fr dl

.phony:$(PHONY)

