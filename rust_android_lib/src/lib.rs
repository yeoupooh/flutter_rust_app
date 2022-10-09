extern crate jni;
/// Expose the JNI interface for android below
#[cfg(target_os = "android")]
#[allow(non_snake_case)]
use jni::objects::{JClass, JString};
use jni::sys::jstring;
use jni::JNIEnv;
use rust_lib::greet;
use std::ffi::{CStr, CString};

#[no_mangle]
// NOTE method name SHOULD NOT have "_". Otherwise the function cannot find on android.
// NOTE _1 means _ for jni spec.
// See https://stackoverflow.com/questions/16069209/invoking-jni-functions-in-android-package-name-containing-underscore
pub unsafe extern "system" fn Java_com_example_flutter_1rust_1app_MainActivity_greet(
    env: JNIEnv,
    _: JClass,
    java_to: JString,
) -> jstring {
    // Our Java companion code might pass-in "world" as a string, hence the name.
    let javastr_to = env.get_string(java_to).expect("invalid to string").as_ptr();
    let cstr_to = CStr::from_ptr(javastr_to);
    let str_to = match cstr_to.to_str() {
        Ok(str_to) => str_to.to_owned(),
        Err(_) => "there".to_owned(),
    };
    let result = greet(str_to);
    // Retake pointer so that we can use it below and allow memory to be freed when it goes out of scope.
    let world_ptr = CString::from_raw(CString::new(result).unwrap().into_raw());
    let output = env
        .new_string(world_ptr.to_str().unwrap())
        .expect("Couldn't create java string!");

    output.into_inner()
}
