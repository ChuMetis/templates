<#noparse>
PROJECT_ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
PROJECT_ROOT := $(PROJECT_ROOT:%/=%)

#NUTTX_SRC_URL=https://bitbucket.org/nuttx/nuttx.git
#NUTTX_APP_URL=https://bitbucket.org/nuttx/apps.git

NUTTX_SRC_URL=git@gitlab.chustate.com:nuttx/NuttX.git
NUTTX_APP_URL=git@gitlab.chustate.com:nuttx/apps.git

EXE_CWD:=${PROJECT_ROOT}
include $(PROJECT_ROOT)/metis.config



all:${CONFIG_EXE_CMD}

${CONFIG_EXE_CMD}:${PROJECT_ROOT}/nuttx/.config ${PROJECT_ROOT}/apps
	cd $(dir $<); make V=1 | tee ${PROJECT_ROOT}/nuttx/build.log

${PROJECT_ROOT}/nuttx/.config:${PROJECT_ROOT}/nuttx
	[ -e ${PROJECT_ROOT}/nuttx/.config ] || (cd $</tools;./configure.sh -a ../apps sim/nsh)

${PROJECT_ROOT}/nuttx:${PROJECT_ROOT}/apps
	git clone ${NUTTX_SRC_URL} $@

${PROJECT_ROOT}/apps:
	git clone ${NUTTX_APP_URL} $@

clean:${PROJECT_ROOT}/nuttx
	cd $< ; make clean
	rm -f ${PROJECT_ROOT}/nuttx/build.log

</#noparse>
