#!/bin/bash

./prokawa-toxi.sh --main -T go --module-static -C ./PolarUnravel.scm

export J=java
export CLASSPATH=./:./lib/toxiclibs/dist/colorutils.jar:./lib/toxiclibs/dist/toxiclibscore.jar:./target/prokawa-1.0-SNAPSHOT-jar-with-dependencies.jar:
export LIBPATH=./lib/toxiclibs/lib/jogl/

$J -cp $CLASSPATH -Djava.library.path=$LIBPATH go
