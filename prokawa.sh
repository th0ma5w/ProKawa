#!/bin/bash

#load the environment

. manual_environment

#envoke the read-eval-print loop from Kawa, passing all flags

$J -cp $CLASSPATH -Djava.library.path=$LIBPATH kawa.repl $@

