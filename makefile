# Variables
CC=gcc
CCLINK=$(CC)
CFLAGS=-g -Wall -std=c99
OBJS=main.o file0.o file1.o file2.o file3.o file4.o
EXEC=prog.exe
RM=rm -rf *.o *.exe

# Default (first rule)
$(EXEC): $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

file0.o: file0.c file0.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c file0.c

file1.o: file1.c file1.h file2.h
	$(CC) $(CFLAGS) -c file1.c

file2.o: file2.c file2.h file1.h
	$(CC) $(CFLAGS) -c file2.c

file3.o: file3.c file3.h file0.h file4.h
	$(CC) $(CFLAGS) -c file3.c

file4.o: file4.c file4.h file0.h file1.h
	$(CC) $(CFLAGS) -c file4.c

main.o: main.c file0.h file1.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c main.c

# Clean .o and .exe files
clean:
	$(RM)