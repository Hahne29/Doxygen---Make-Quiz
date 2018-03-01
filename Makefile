all: build doczip

build: myexe

myexe: collegemain.o college.o course.o
	g++ collegemain.o college.o course.o -o exec

collegemain.o: collegemain.cc tarray.h node.h
	g++ -c collegemain.cc

college.o: college.cc college.h
	g++ -c college.cc

course.o: course.cc course.h
	g++ -c course.cc

clean: 
	rm -rf *o exec documentation.zip
	rm -rf ./Documentation/html
	

doczip:
	make doc
	zip -r documentation.zip ./Documentation

doc: collegemain.cc college.cc course.cc college.h course.h node.h tarray.h Makefile
	doxygen


	
