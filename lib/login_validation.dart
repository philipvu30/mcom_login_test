import 'dart:async';

import 'package:mcom_login_test/constants.dart';

class LoginValidation {
  final validateEmailField =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    email.length == 0
        ? sink.add('')
        : RegExp(kEmailRegex).hasMatch(email)
            ? sink.add(email)
            : sink.addError(kInvalidEmailError);
  });

  final validatePasswordField = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    password.length == 0
        ? sink.add('')
        : (password.length >= 6)
            ? sink.add(password)
            : sink.addError(kInvalidPasswordError);
  });
}
