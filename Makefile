
all:
	make build
	make doczip

build: collegemain.o college.o course.o
	g++ collegemain.o college.o course.o -o myexe

collegemain.o: collegemain.cc
	g++ -c collegemain.cc

college.o: college.cc college.h
	g++ -c college.cc

course.o: course.cc course.h
	g++ -c course.cc

clean:
	rm *.o myexe
	rm -r html
	rm -r latex

archive:
	tar cvf archive.tar.gz *

doczip:
	doxygen collegemain.cc
	doxygen college.cc
	doxygen course.cc

myexe:
	./myexe
