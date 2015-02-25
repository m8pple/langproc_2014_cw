
# Build the compiler, then copy the compiled binary into output dir
bin/compiler : src/compiler
	cd src && $(MAKE)
	cp $< $@

build : bin/compiler

tests_build : bin/compiler
	cd test && $(MAKE) build
	
tests_run : bin/compiler
	cd test && $(MAKE) run

all : build tests_run tests_build
