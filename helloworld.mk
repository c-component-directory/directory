CCD_HELLOWORLD_NAME = helloworld
CCD_HELLOWORLD_DESCRIPTION = Hello World C code integration example
CCD_HELLOWORLD_VERSION = e14c01e
CCD_HELLOWORLD_MIRROR_1 = https://github.com/c-component-directory/helloworld.git

UNAME_S := $(shell uname -s)

ccd_helloworld:
	if [ -d components/helloworld/build ]; then rm -rf components/helloworld/build; fi
	mkdir -p components/helloworld/build
	cd components/helloworld/build && git clone ${CCD_HELLOWORLD_MIRROR_1}
	cd components/helloworld/build/helloworld && git checkout ${CCD_HELLOWORLD_VERSION} && make
	if [ -d components/helloworld/lib ]; then rm -rf components/helloworld/lib; fi
	if [ -d components/helloworld/include ]; then rm -rf components/helloworld/include; fi
	mkdir -p components/helloworld/lib
ifeq ($(UNAME_S),Darwin)
	cp -af components/helloworld/build/helloworld/libhelloworld.dylib components/helloworld/lib/
else
	cp -af components/helloworld/build/helloworld/libhelloworld.so components/helloworld/lib/
endif
	cp -af components/helloworld/build/helloworld/libhelloworld.a components/helloworld/lib/
	mkdir -p components/helloworld/include
	cp -af components/helloworld/build/helloworld/helloworld.h components/helloworld/include/
	rm -rf components/helloworld/build
	@echo && echo "Component ${CCD_HELLOWORLD_NAME} has been successfully built"
	@echo && echo "Libraries are available at: components/${CCD_HELLOWORLD_NAME}/lib"
	@echo && ls -l components/${CCD_HELLOWORLD_NAME}/lib
	@echo && echo "Headers are available at: components/${CCD_HELLOWORLD_NAME}/include"
	@echo && ls -l components/${CCD_HELLOWORLD_NAME}/include
	@echo
