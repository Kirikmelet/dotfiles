#!/bin/sh

function source_file() {
	if [ -f $1 ]; then
		. $1
	fi
}
