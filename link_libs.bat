@echo off

set BASE_PATH=%CD%\target
set BUILD_TARGET=release
set LIB_NAME=librust_clib.so
set JNI_LIBS_PATH=android\app\src\main\jniLibs

echo Deleting jniLibs folder
rd /s/q %JNI_LIBS_PATH%

setlocal enableextensions
md %JNI_LIBS_PATH%\arm64-v8a
md %JNI_LIBS_PATH%\armeabi-v7a
md %JNI_LIBS_PATH%\x86
md %JNI_LIBS_PATH%\x86_64
endlocal

call :make_link aarch64-linux-android   arm64-v8a
call :make_link armv7-linux-androideabi armeabi-v7a
call :make_link i686-linux-android      x86
call :make_link x86_64-linux-android    x86_64

goto :end

:make_link
set INPUT_NAME=%1
set OUTPUT_NAME=%2
set FROM=%BASE_PATH%\%INPUT_NAME%\%BUILD_TARGET%\%LIB_NAME%
set TO=%JNI_LIBS_PATH%\%OUTPUT_NAME%\%LIB_NAME%
echo Make link from %FROM% to %TO%
mklink %TO% %FROM%

goto :eof

:end

dir /s %JNI_LIBS_PATH% 

echo Done.
