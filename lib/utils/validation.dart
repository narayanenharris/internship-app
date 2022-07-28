String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter a name';
  } else {
    return null;
  }
}

String? validateDateOfBirth(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter Date Of Birth';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  String re = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  RegExp regex = RegExp(re);

  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

String? validateMobile(String? value) {
  if (value == null || value.length < 10) {
    return 'Enter a valid mobile number';
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) {
    return 'Password should be atleast 6 characters long';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? value, String? password) {
  if (value == null || value.length < 6) {
    return 'Password should be atleast 6 characters long';
  } else if (value == password) {
    return 'Confirm password should be same as password';
  } else {
    return null;
  }
}
