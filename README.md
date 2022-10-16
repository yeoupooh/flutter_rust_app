# flutter_rust_app

This app demonstrate how to use Rust library on Android and iOS.

# Android App

## Rust library for Android

### Setup config file: .cargo/config.toml

```
[build]
target = [
    "aarch64-linux-android",
    "armv7-linux-androideabi",
    "i686-linux-android",
    "x86_64-linux-android",
]

[target.aarch64-linux-android]
# ar = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\llvm-ar.exe"
# linker = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\aarch64-linux-android30-clang.cmd"
ar = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-ar"
linker = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/aarch64-linux-android30-clang"

[target.armv7-linux-androideabi]
# ar = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\llvm-ar.exe"
# linker = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\armv7a-linux-androideabi30-clang.cmd"
ar = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-ar"
linker = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/armv7a-linux-androideabi30-clang"

[target.i686-linux-android]
# ar = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\llvm-ar.exe"
# linker = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\i686-linux-android30-clang.cmd"
ar = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-ar"
linker = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/i686-linux-android30-clang"

[target.x86_64-linux-android]
# ar = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-ar"
# linker = "(your android ndk path)\\22.1.7171670\\toolchains\\llvm\\prebuilt\\windows-x86_64\\bin\\x86_64-linux-android30-clang.cmd"
ar = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-ar"
linker = "(your android ndk path)/22.1.7171670/toolchains/llvm/prebuilt/darwin-x86_64/bin/x86_64-linux-android30-clang"
```

### Build Rust libraries

```
pushd rust_android_jna_lib
cargo build --release
popd
```

### Link built library files

```
. ./link_libs.sh
```

## Build Android app

```
flutter run
```

# iOS App

TODO
