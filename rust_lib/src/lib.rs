pub fn greet(to: String) -> String {
    format!("Hello, {}", to)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_greet() {
        let result = greet("World".to_owned());
        assert_eq!(result, "Hello, World".to_owned());
    }
}
