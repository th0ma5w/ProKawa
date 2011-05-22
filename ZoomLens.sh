#!/bin/bash

#load the environment

. manual_environment


#compile the class, not entirely necessary, but demonstrated here

$J -cp $CLASSPATH -Djava.library.path=$LIBPATH kawa.repl --main -T go --module-static -C ./ZoomLens.scm


#call the compiled class, it will be found in the current working path as specified in line one of classpath above

$J -cp $CLASSPATH -Djava.library.path=$LIBPATH go
