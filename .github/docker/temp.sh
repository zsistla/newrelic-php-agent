#!/bin/bash

TEMP=$(php-config --prefix)
echo $TEMP

  if [ "$(uname -s)" = 'Linux' ]; then
    PHP_PREFIX=$(php-config --prefix)
    PHP_SAPIS=$(php-config --php-sapis)
echo $PHP_PREFIX
echo $PHP_SAPIS
  fi
