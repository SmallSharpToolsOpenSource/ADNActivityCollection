#!/bin/sh

if [ ! -e "BBlock/.git" ]; then
  git submodule init BBlock
  git submodule update BBlock
fi

