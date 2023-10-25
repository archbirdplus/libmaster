
CC=gcc-13

build/helloworld.o: examples/helloworld/helloworld.c build/libmaster.so
	echo "Building hello world"
	$(CC) $(CFLAGS) examples/helloworld/helloworld.c -Lbuild -lmaster -I src/libmaster/include/ -o build/helloworld.o

build/libmaster.so: src/libmaster/include/master.h src/libmaster/master.c
	echo "Building libmaster"
	$(CC) $(CFLAGS) -c src/libmaster/master.c -Xlinker -dynamic -o build/libmaster.so

clean:
	rm -rf build/*

