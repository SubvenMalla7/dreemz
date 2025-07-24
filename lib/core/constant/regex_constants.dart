class RegexConstants {
  // Regular expression to match at least one digit [0-9]
  static RegExp numberRegEx = RegExp(r'^(?=.*[0-9])');

  // Regular expression to match at least one special character from the set [!@#$&*~]
  static RegExp specialRegEx = RegExp(r'^(?=.*[!@#\$&*~])');

  // Regular expression to match at least one uppercase letter [A-Z]
  static RegExp uppercaseRegEx = RegExp(r'^(?=.*[A-Z])');

  // Regular expression to match at least one lowercase letter [a-z]
  static RegExp lowercaseRegEx = RegExp(r'^(?=.*[a-z])');

  // Regular expression to enforce password requirements:
  // - At least one uppercase letter [A-Z]
  // - At least one lowercase letter [a-z]
  // - At least one digit [0-9]
  // - At least one special character from the set [!@#$&*~]
  // - Minimum length of 8 characters
  static RegExp passwordRegEx =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  // Regular expression to validate email addresses
  static RegExp emailRegEx =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
}
