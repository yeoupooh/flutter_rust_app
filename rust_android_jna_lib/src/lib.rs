use rust_lib;
use std::ffi::{c_char, CStr};

fn string_to_c_chars(s: String) -> *mut c_char {
    let bytes = s.into_bytes();
    let mut c_chars: Vec<c_char> = bytes.iter().map(|c| *c as c_char).collect::<Vec<c_char>>();
    c_chars.push(0); // null-terminated
    c_chars.as_mut_ptr()
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
