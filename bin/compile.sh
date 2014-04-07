#!/bin/sh

indent() {
  sed -u 's/^/       /'
}

echo "-----> Install ffmpeg-thumbnailer"
BUILD_DIR=$1
VENDOR_DIR="vendor"
DOWNLOAD_URL="https://ffmpegthumbnailer.googlecode.com/files/ffmpegthumbnailer-2.0.8.tar.gz"

echo "DOWNLOAD_URL = " $DOWNLOAD_URL | indent

cd $BUILD_DIR
mkdir -p $VENDOR_DIR
cd $VENDOR_DIR
curl -L --silent $DOWNLOAD_URL | tar xz

echo "exporting PATH and LIBRARY_PATH" | indent
PROFILE_PATH="$BUILD_DIR/.profile.d/ffmpeg-thumbnailer.sh"
mkdir -p $(dirname $PROFILE_PATH)
echo 'export PATH="$PATH:vendor/ffmpeg-thumbnailer/bin"' >> $PROFILE_PATH
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:vendor/ffmpeg-thumbnailer/lib"' >> $PROFILE_PATH