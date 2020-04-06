
V:=@

.ONESHELL:
.SHELLFLAGS=-ec
CAFBASEROOT=..
RM    		:= rm -fr
.PHONY : all clean 

all:  wrapper_tcl_as_exe.exe


# Sdx - for creating the starkit and starpack
SDX 		:= ./tools/sdx-20110317.kit
# Tclkit to execute sdx from the command line (no GUI)
TCLKIT 	:=  ./tools/tclkitsh-8.5.9-win32.upx.exe

tclkit.exe:
	cp ./tools/tclkitsh-8.5.9-win32.upx.exe tclkit.exe

wrapper_tcl_as_exe.vfs: gen_clean
	$(TCLKIT) $(SDX)  qwrap ./src/wrapper_tcl_as_exe.tcl
	$(TCLKIT) $(SDX) unwrap wrapper_tcl_as_exe.kit

wrapper_tcl_as_exe.exe:  wrapper_tcl_as_exe.vfs tclkit.exe
	mkdir ./pre_compiled
	$(TCLKIT) $(SDX) wrap ./pre_compiled/wrapper_tcl_as_exe.exe -runtime tclkit.exe
	$(V)$(RM) wrapper_tcl_as_exe.vfs wrapper_tcl_as_exe.kit tclkit.exe
gen_clean:
	$(V)$(RM) ./pre_compiled wrapper_tcl_as_exe.vfs wrapper_tcl_as_exe.kit tclkit.exe
clean:
	$(V)$(RM) ./pre_compiled wrapper_tcl_as_exe.vfs wrapper_tcl_as_exe.kit tclkit.exe 

