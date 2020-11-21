
V:=@
.ONESHELL:
.SHELLFLAGS=-ec
RM:=rm -rf 
ROOT=..
glm_file:=$(shell ls *.glm) 
glm_name:=$(basename $(glm_file))
glm_vfs:=$(addsuffix .vfs,$(glm_name))
TCLKIT:=$(ROOT)/tools/tclkitsh-8.5.9-win32.upx.exe
SDX:=$(ROOT)/tools/sdx-20110317.kit

.FORCE:
.PHONY : all clean unpack

all: unpack 

unpack: 	
	$(V)echo "=======UNPACK $(glm_file) to $(glm_vfs) START=========" 
	$(V)$(RM) $(glm_vfs)
	$(V)$(TCLKIT) $(SDX)  unwrap $(glm_file)
	$(V)echo "=======UNPACK $(glm_file) to $(glm_vfs)DONE ========="

clean:
	$(V)echo "======= CLEAN $(glm_vfs) START=========" 
	$(V)$(RM) $(glm_vfs)
	$(V)echo "======= CLEAN $(glm_vfs) END=========" 

