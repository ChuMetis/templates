PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(PROJECT_ROOT)/metis.config

#OBJS = ${projectName}.o
OBJS = main.o

#ifeq ($(BUILD_MODE),debug)
	CFLAGS += -g
#else ifeq ($(BUILD_MODE),run)
#	CFLAGS += -O2
#else
#	$(error Build mode $(BUILD_MODE) not supported by this Makefile)
#endif

#all:	${projectName}
all:	main

#${projectName}:	$(OBJS)
main:	$(OBJS)
	<#noparse>$(CONFIG_BUILD_PREFIX)</#noparse>$(CXX) -o $@ $^

%.o:	$(PROJECT_ROOT)%.cpp
	<#noparse>$(CONFIG_BUILD_PREFIX)</#noparse>$(CXX) -c $(CFLAGS) $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

%.o:	$(PROJECT_ROOT)%.c
	<#noparse>$(CONFIG_BUILD_PREFIX)</#noparse>$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

clean:
	rm -fr main $(OBJS)
#	rm -fr ${projectName} $(OBJS)

