# Entry point for physicsTesting makefiles
# Based loosely off FreeImage makefiles - thanks, doods
# Default to 'make -f Makefile.unix' for Linux and for unknown OS. 
#
OS = $(shell uname -s)
MAKEFILE = unix

ifneq (,$(findstring MINGW,$(OS)))
    MAKEFILE = mingw
	SHELL = C:/Windows/System32/cmd.exe
endif

all : default oggstreaming

default:
	$(MAKE) -f Makefile.$(MAKEFILE) 

oggstreaming:
	cd ogg-streaming && $(MAKE) -f Makefile.$(MAKEFILE)

clean:
	$(MAKE) -f Makefile.$(MAKEFILE) clean 
	cd ogg-streaming && $(MAKE) -f Makefile.$(MAKEFILE) clean 
	
