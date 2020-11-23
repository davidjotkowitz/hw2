# These are variables. We usually define CC, CCLINK, CFLAGS, and OBJS
CC=gcc
CCLINK=$(CC) # Read variable CC using $(CC)
CFLAGS=-g -Wall -std=c99
OBJS=main.o file0.o file1.o file2.o file3.o file4.o
EXEC=prog.exe
RM= rm -rf *.o *.exe

# "make prog.exe" or just "make" will prepare an executible file for us
$(EXEC): $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

# Full rule syntax with custom Shell commands. 
# We've added all the h file rules in their proper hierarchy.

file0.o: file0.c file0.h file1.h file3.h
	$(CC) $(CFLAGS) -c file0.c
	
file1.o: file1.c file1.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c file1.c
	
file2.o: file2.c file2.h file0.h file1.h
	$(CC) $(CFLAGS) -c file2.c
	
file3.o: file3.c file3.h file1.h file2.h
	$(CC) $(CFLAGS) -c file3.c
	
file4.o: file4.c file4.h file0.h file2.h
	$(CC) $(CFLAGS) -c file4.c

03-main.o: 03-main.c file0.h file1.h file2.h file3.h file4.h 
	$(CC) $(CFLAGS) -c 03-main.c	


# Custom rule - we can invoke it manually by calling "make clean"
clean:
	$(RM)