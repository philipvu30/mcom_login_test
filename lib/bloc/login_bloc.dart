import 'package:mcom_login_test/bloc/bloc.dart';
import 'package:mcom_login_test/login_validation.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidation implements Bloc {
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  Observable<String> get emailStream =>
      _emailController.stream.transform(validateEmailField);
  Observable<String> get passwordStream =>
      _passwordController.stream.transform(validatePasswordField);
  Observable<bool> get submitStream => Observable.combineLatest2(
      emailStream, passwordStream, (email, password) => true);

  Function(String) get emailChange => _emailController.sink.add;

  Function(String) get passwordChange => _passwordController.sink.add;

  String authValue() {
    return (_emailController.value == 'demo@mcom.app' &&
            _passwordController.value == '12345678')
        ? 'Login successful'
        : 'Failed to login';
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
