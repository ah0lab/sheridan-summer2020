obj=part_2
cc=gcc
cflags=-Wall -fmax-errors=5 -Isrc/include/
ldflags=-Lbuild/ -lbinarytree

$(obj): libbinarytree
	$(cc) $(cflags) src/program.c -o build/$(obj) $(ldflags)

libbinarytree: binarytree
	ar ruv build/libbinarytree.a build/binarytree.o

binarytree: 
	$(cc) $(cflags) -c src/binarytree.c -o build/binarytree.o

.PHONY:clean

clean: 
	rm build/*