String? validateNotEmpty(String value) {
  if (value.length == 0)
    return 'field is required!';
  else
    return null;
}

String? validateMinLength(String value, {int length = 6}) {
  if (value.length < length)
    return 'minimum $length character are required !';
  else
    return null;
}

String? validateMeetingCode(String value, {int length = 9}) {
  if (value.length != length)
    return 'Meeting code must be of $length digit !';
  else
    return null;
}

String? validatePhone(String value) {
  if (value.length < 10)
    return 'minimum 10 numbers required !';
  else
    return null;
}

String? validateEmptyPhone(String value) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value))
    return 'valid phone is required !';
  else
    return null;
}

String? validateName(String value) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value))
    return 'valid name is required !';
  else
    return null;
}

String? validateLengthName(String value, {int length = 50}) {
  if (value.length > length)
    return 'Maxmum character is 50 ';
  else
    return null;
}

String? validateEmail(String value) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value))
    return 'valid email is required !';
  else
    return null;
}

String? validateLengthEmail(String value, {int length = 50}) {
  if (value.length > length)
    return 'Maxmum character is 50 ';
  else
    return null;
}

String? validatePassword(String value) {
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value))
    return 'valid password is required !';
  else
    return null;
}

String? validateDelete(String value) {
  if (value != "DELETE")
    return 'Please Type Delete';
  else
    return null;
}

// void showShortToast(String message) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.green,
//       fontSize: 16.0
//   );
// }
