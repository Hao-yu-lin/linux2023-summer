all: qsort_futex

CC = gcc
CFLAGS := -Wall -D_GNU_SOURCE -fsanitize=thread -DUSE_LINUX
LDFLAGS := -lpthread


qsort_futex: qsort_futex.c atomic.h  cond.h  futex.h  mutex.h  spinlock.h
	$(CC) $(CFLAGS) qsort_futex.c -o qsort_futex $(LDFLAGS)

clean:
	rm -rf qsort_futex