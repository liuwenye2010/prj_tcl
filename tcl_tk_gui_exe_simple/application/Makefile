
V:=@
.ONESHELL:
.SHELLFLAGS=-ec
SLASH=/
SDX=../../tools/sdx-20110317.kit
TCLKIT=../../tools/tclkitsh-8.5.9-win32.upx.exe
RM=rm -rf
SRC=./src

GUI_SRC=${SRC}/gui
API_SRC=${SRC}/api

SVN_REVISION=1.2.3.4

DOC_VER	:= $(SVN_REVISION)
#DOC_VER := $(shell echo "$(DOC_VER)"| $(SED) -r 's/[\/ :_@]/-/g')

all: application.exe 

application.kit: 
	$(V)echo SDX $@
	touch $@ && $(RM) $@ && $(TCLKIT) $(SDX) wrap $@ -writable

tclkit-gui.exe:
	cp ../../tools/tclkit-gui-8_6_3-twapi-4_0_61-x86-max.exe tclkit-gui.exe

tclkit85-linux-x86:
	cp ../../tools/tclkit85-linux-x86 .

tclkit-RPi-8.6-gui:
	cp ../../tools/tclkit-RPi-8.6-gui .


application.vfs: clean ${SRC}/application.tcl ${API_SRC}/application_api.tcl config.tcl
	$(TCLKIT) $(SDX)  qwrap ${SRC}/application.tcl
	$(TCLKIT) $(SDX) unwrap application.kit
	cp ${GUI_SRC}/*.tcl ${API_SRC}/*.tcl application.vfs/lib/app-application/
	cp config.tcl application.vfs/lib/app-application/

application.exe: application.vfs tclkit-gui.exe 
	$(TCLKIT) $(SDX) wrap application.exe -runtime tclkit-gui.exe


application_linux: application.vfs/lib/golem application.vfs/lib/extensions tclkit85-linux-x86
	$(TCLKIT) $(SDX) wrap application -runtime tclkit85-linux-x86
	mv application $@

application_linux_arm: application.vfs/lib/golem application.vfs/lib/extensions tclkit-RPi-8.6-gui
	$(TCLKIT) $(SDX) wrap application -runtime tclkit-RPi-8.6-gui
	mv application $@

.FORCE:
.PHONY : all clean

clean:
	$(V) $(RM) application.exe application.vfs application.kit tclkit-gui.exe
make:
	clean
