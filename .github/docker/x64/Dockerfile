#
# Copyright 2020 New Relic Corporation. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#

#
# ARGs passed from GHA workflow.
#
ARG PHP_VER=
FROM php:${PHP_VER}

RUN docker-php-source extract

#
# Uncomment deb-src lines for all enabled repos. First part of single-quoted
# string (up the the !) is the pattern of the lines that will be ignored.
# Needed for apt-get build-dep call later in script
#
RUN sed -Ei '/.*partner/! s/^# (deb-src .*)/\1/g' /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y build-essential

#
# PHP dependencies
#
RUN apt-get update \
 && apt-get -y install gcc git netcat wget unzip \
 libpcre3 libpcre3-dev golang psmisc automake libtool \
 insserv procps vim ${PHP_USER_SPECIFIED_PACKAGES}

RUN apt-get install -y default-libmysqlclient-dev libmcrypt-dev

#
# Other tools
#
RUN apt-get install -y curl gdb valgrind 
#RUN apt-get install -y libcurl4-openssl-dev 
RUN apt-get install -y pkg-config postgresql 
RUN apt-get install -y libpq-dev libedit-dev libreadline-dev git

#
# Install other packages.
#
RUN apt-get update && apt-get install -y \
  autoconf \
  autotools-dev \
  build-essential \
  bzip2 \
  ccache \
  curl \
  dnsutils \
  git \
  golang \
  gyp \
  lcov \
  libc6 \
  libc6-dbg \
  libc6-dev \
  libgtest-dev \
  libtool \
  make \
  perl \
  strace \
  python-dev \
  python-setuptools \
  python-yaml \
  python3-argon2 \
  sqlite3 \
  libsqlite3-dev \
  libghc-argon2-dev \
  openssl \
  libxml2 \
  libxml2-dev \
  libonig-dev \
  libssl-dev \
  telnet \
  unzip \
  wget \
  zip && apt-get clean

#
# These args need to be repeated so we can propagate the VARS within this build context.
#
ARG PHP_VER
ARG ARCH
ARG BUILD_TYPE
ENV PHP_VER=${PHP_VER}
ENV ARCH=$ARCH
ENV BUILD_TYPE=$BUILD_TYPE

COPY /.github/docker/linux/${BUILD_TYPE}_build.sh /build.sh

ENTRYPOINT ["/build.sh"]
