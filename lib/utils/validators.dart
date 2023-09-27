class Validators {
  static String validateEmail(String? value) {
    if (value == null || value.isEmpty == true) {
      return 'Enter a valid email address';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return "";
    }
  }

  static String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    if (!value.contains(RegExp(r'[A-Z]')) &&
        !value.contains(RegExp(r'[a-z]'))) {
      return "Password does not contain an alphabet";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one digit";
    }

    if (value.contains(" ")) {
      return "Password must not contain a space character";
    }

    // if (!value.contains(new RegExp(r'[a-z]'))) {
    //   return "Password does not contain a lowercase character";
    // }

    // if(!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return "Password must contain a special character";
    // }

    return "";
  }

  static String? validatePasswordsMatch(String value1, String value2) {
    if (value1 != value2) {
      return "Passwords do not match!";
    }
    return "";
  }

  static validateEmpty(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static validateLengthGreaterThan(String value, int length) {
    if (value.length > length) {
      return "Should not be longer than $length characters";
    }

    return "";
  }

  static validateLengthLessThan(String value, int length) {
    if (value.length < length) {
      return "Should be $length characters or longer";
    }

    return "";
  }

  static validateIntPhoneNumber(String value) {
    final v = validateEmpty(value);

    if (v == null) {
      String pattern = r'(^(?:[+][0-9][3])?[0-9]{10,12}$)';
      RegExp regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return "Enter a valid phone number";
      } else {
        return "";
      }
    }
    return v;
  }

  static validatePhoneNumber(String value) {
    String pattern = r'(^[0-9]{10,15}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Enter a valid phone number";
    } else {
      return "";
    }
  }

  static bool validateGhanaPostGPS(String value) {
    String pattern = r'^([A-Z]{2})-([0-9]{3}|[0-9]{4})-([0-9]{4})$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return false;
    }

    return true;
  }

  static bool validateTIN(String value) {
    String pattern = r'^([A-Z]{1})([0-9]{10})$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return false;
    }

    return true;
  }

  static validateIsNumeric(String s) {
    if (double.tryParse(s) == null) {
      return "Enter a valid numeric value";
    }

    return "";
  }

  static validateName(String s) {
    if (s.length < 2) {
      return 'Your name should be more than one character long';
    }

    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(s)) {
      return 'Enter a valid name';
    }

    return "";
  }

  static validateURL(String? s) {
    if (s == null) {
      return null;
    }

    String pattern =
        r"(https://|http://)?([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    bool match = RegExp(pattern, caseSensitive: false).hasMatch(s);
    if (!match) {
      return "Enter a valid URL";
    }

    return "";
  }
}
