#!/bin/bash

CSCOPE_FILE=cscope.files
if [ -n "$1" ]; then
	echo "Source code directory: " $1
	echo "Create file map : " $CSCOPE_FILE
    # you can modify here for your source file suffix
    # Android
	find $1 -path "$1/out/*"    -prune -o \
            -name "*.aidl"  -print -o \
            -name "*.cc"    -print -o \
            -name "*.h"     -print -o \
            -name "*.c"     -print -o \
            -name "*.cpp"   -print -o \
            -name "*.java"  -print -o \
            -name "*.mk"    -print -o \
            -name "*.hpp"   -print -o \
            -name "*.xml"   -print -o \
            -name "*.[chxsS]"   -print \
            > $CSCOPE_FILE
	cscope -bkq -i $CSCOPE_FILE
	# ctags -R --exclude=.svn
else
	echo "Please key-in path of project"
fi

