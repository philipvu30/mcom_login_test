import 'package:flutter/material.dart';
import 'package:mcom_login_test/bloc/login_bloc.dart';
import 'package:mcom_login_test/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCOM Login Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<dynamic>.value(
        value: LoginBloc(),
        child: LoginScreen(),
      ),
    );
  }
}
