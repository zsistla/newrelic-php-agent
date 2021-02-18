#!/bin/bash

#
# Copyright 2020 New Relic Corporation. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

cd /newrelic-php-agent
echo php $PHP_VER
echo arch $ARCH
#"PHPS=${PHP_VER}"
make -j $(nproc) clean
#make -j $(nproc) all "ARCH=${ARCH}"
make -j $(nproc) run_tests "ARCH=${ARCH}"
