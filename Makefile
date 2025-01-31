all: libste.a example

libste.a: stechr.o stecpe.o stecpy.o steprn.o
	$(AR) $(ARFLAGS) $@ $^

example: example.o libste.a

tests: tests.o libste.a

check: tests FRC
	prove -v ./tests

README: libste.3
	mandoc -Tutf8 $^ | col -bx >$@


clean: FRC
	rm -f *.o *.a example tests

FRC:
