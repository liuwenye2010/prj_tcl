TCLDIR = ../tcl85
TCLINCDIR = $(TCLDIR)/include
TCLLIBDIR = $(TCLDIR)/lib
TCLLIB = $(TCLLIBDIR)/libtcl8.5.a

all: example.so

example.so : example.o
	g++ -shared -o example.so example.o $(TCLLIB)

example.o : example.cpp
	g++ -fPIC -I$(TCLINCDIR) example.cpp -c -o example.o
	
clean:
	rm -f  *.o example.so