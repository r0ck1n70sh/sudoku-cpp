#!/bin/bash

wget_make_install() {
  wget $1
  make_install $@
}

clone_make_install() {
  git clone --depth=1 $1
  make_install $@
}

make_install() {
  tar -xvf $2
  cd $3
  ./autogen.sh --prefix=$4
  make
  make check
  sudo make install
  rm -rf *
}

# keeping deps in separate dir
DIR=deps

mkdir ./$DIR
cd ./$DIR

# install deps from source
sudo apt install \
  build-essential \
  git \
  g++ \
  autotools-dev \
  libgtkmm-3.0-dev \
  libgtkmm-3.0-doc \
  mm-common \
  pkg-config


export PKG_CONFIG_PATH=/usr/lib/pkgconfig/


# sigc3.0
URL="https://download.gnome.org/sources/libsigc++/3.0/libsigc%2B%2B-3.0.1.tar.xz"
FILENAME="libsigc++-3.0.1"
TAR=$FILENAME.tar.xz
PREFIX=/usr/local

wget_make_install $URL $TAR $FILENAME $PREFIX


# giomm-2.52
URL="https://download.gnome.org/sources/glibmm/2.74/glibmm-2.74.0.tar.xz"
FILENAME="glibmm-2.74.0"
TAR=$FILENAME.tar.xz
PREFIX=/usr

wget_make_install $URL $TAR $FILENAME $PREFIX


# cairomm
URL="https://www.cairographics.org/releases/cairomm-1.6.0.tar.gz"
FILENAME="cairomm-1.6.0"
TAR=$FILENAME.tar.gz
PREFIX=/usr

wget_make_install $URL $TAR $FILENAME $PREFIX


# pango
URL="https://download.gnome.org/sources/pango/1.49/pango-1.49.0.tar.xz"
FILENAME="pango-1.49.0"
TAR=$FILENAME.tar.xz
PREFIX=/usr

wget_make_install $URL $TAR $FILENAME $PREFIX


# pangomm
URL="https://download.gnome.org/sources/pangomm/2.43/pangomm-2.43.1.tar.xz"
FILENAME="pangomm-2.43.1"
TAR=$FILENAME.tar.xz
PREFIX=/usr

wget_make_install $URL $TAR $FILENAME $PREFIX
