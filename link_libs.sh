#!/bin/bash

BASE_PATH=$PWD/target
BUILD_TARGET=release
LIB_NAME=librust_android_jna_lib.so
JNI_LIBS_PATH=android/app/src/main/jniLibs

rm -rf $JNI_LIBS_PATH

mkdir -p $JNI_LIBS_PATH/arm64-v8a
mkdir -p $JNI_LIBS_PATH/armeabi-v7a
mkdir -p $JNI_LIBS_PATH/x86
mkdir -p $JNI_LIBS_PATH/x86_64

ln -s $BASE_PATH/aarch64-linux-android/$BUILD_TARGET/$LIB_NAME $JNI_LIBS_PATH/arm64-v8a/$LIB_NAME
ln -s $BASE_PATH/armv7-linux-androideabi/$BUILD_TARGET/$LIB_NAME $JNI_LIBS_PATH/armeabi-v7a/$LIB_NAME
ln -s $BASE_PATH/i686-linux-android/$BUILD_TARGET/$LIB_NAME $JNI_LIBS_PATH/x86/$LIB_NAME
ln -s $BASE_PATH/x86_64-linux-android/$BUILD_TARGET/$LIB_NAME $JNI_LIBS_PATH/x86_64/$LIB_NAME