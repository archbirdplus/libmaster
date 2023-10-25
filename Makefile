
CC?=gcc
CFLAGS?=

build/helloworld.o: build examples/helloworld/helloworld.c build/libmaster.so build
	$(CC) $(CFLAGS) examples/helloworld/helloworld.c -Lbuild -lmaster -I src/libmaster/include/ -o build/helloworld.o

build/libmaster.so: build src/libmaster/include/master.h src/libmaster/master.c
	$(CC) $(CFLAGS) -c src/libmaster/master.c -Xlinker -dynamic -o build/libmaster.so

build:
	mkdir build

clean:
	rm -rf build/*

