# variables

CC=g++
MINGW=x86_64-w64-mingw32-g++ -static-libgcc -static-libstdc++

CFLAGS=-O3 -g 

INC=./src/*

# linux
.PHONY: default
default: pn_image
pn_image:
	$(CC) $(INC) $(CFLAGS) -o $@ $^

# windows
.PHONY: windows
windows: pn_image.exe
pn_image.exe:
	$(MINGW) -o $@ $^ ${INC}

# both
.PHONY: all 
all: default windows

# clean
.PHONY: clean
clean:
	rm -f pn_image *.exe *.ppm 