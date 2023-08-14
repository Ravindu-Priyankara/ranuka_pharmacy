///validator class
///
class Validator {
  ///name validation function
  static String? validateName({required String name}) {
    ///not to be null or empty.
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  ///email validation function
  static String? validateEmail({required String email}) {
    ///not to be null and it should be correct format.
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  ///password validation function
  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }
    ///not be empty and it need to be more than six characters.
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }
}
///End of the file (EOF)