use rust_lib;
use std::ffi::{c_char, CStr, CString};

fn string_to_c_chars(s: String) -> *mut c_char {
    let cstring = CString::new(s).unwrap();
    cstring.into_raw()
}

fn c_chars_to_string(c_chars: *const c_char) -> String {
    let c_str = unsafe { CStr::from_ptr(c_chars) };
    match c_str.to_str() {
        Err(_) => "error".to_owned(),
        Ok(string) => string.to_owned(),
    }
}

#[no_mangle]
pub extern "C" fn jnagreet(to: *const c_char) -> *mut c_char {
    let result = rust_lib::greet(c_chars_to_string(to));
    string_to_c_chars(result)
}
