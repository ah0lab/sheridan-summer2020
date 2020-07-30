obj=part_1
cc=gcc
cflags=-Wall -fmax-errors=5 -Isrc/include/
ldflags=-Lbuild/ -lqueue

$(obj): libqueue
	$(cc) $(cflags) src/program.c -o build/$(obj) $(ldflags)

libqueue: queue
	ar ruv build/libqueue.a build/queue.o

queue:
	$(cc) $(cflags) -c src/queue.c -o build/queue.o

.PHONY: clean

clean:
	rm build/*