CC=gcc
CFLAGS=-fexceptions -fstack-protector-all -pthread -O2 -g -Wall -Wextra -Wno-unknown-pragmas -Werror-implicit-function-declaration -Werror -Wno-unused-parameter -Wdeclaration-after-statement -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -I$(shell pwd)/include
LDFLAGS=-lcheck 
SOURCES= test/testmain.c test/sockaddr_test.c src/sockaddr_util.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=testmain

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf src/*o test/*o *o $(EXECUTABLE)
