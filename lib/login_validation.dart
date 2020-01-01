import 'dart:async';

class LoginValidation {
  final validateEmailField =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    email.length == 0
        ? sink.add('')
        : RegExp(r"@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)
            ? sink.add(email)
            : sink.addError('Invalid email.');
  });

  final validatePasswordField = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    password.length == 0
        ? sink.add('')
        : (password.length >= 6)
            ? sink.add(password)
            : sink
                .addError('Password length must be greater than 5 characters.');
  });
}
