#!/usr/bin/env bash

export BLACK=0x10000000
export WHITE=0xffffffff
export TRANSPARENT=0x00000000
if [ "$USER" = "s" ]; then
	export BAR_COLOR=0x9C000000
else
	export BAR_COLOR=$BLACK
fi
export RED=0xffed8796
