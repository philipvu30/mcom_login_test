import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool eyeToggle = false;

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: (SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  logoWidget(),
                  SizedBox(
                    height: 20.0,
                  ),
                  loginForm(loginBloc),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget loginForm(loginBloc) {
    return Container(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(bottom: 16.0),
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              emailInputWidget(loginBloc),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              passwordInputWidget(loginBloc),
              SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Forgot password?',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              loginButton(loginBloc),
              signUpButton(),
              SizedBox(
                width: 250.0,
                height: 1.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(child: Text('or login with')),
              socialWidget(),
              skipRegistrationWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget skipRegistrationWidget() {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Skip registration? Touch me!',
            style: TextStyle(color: Colors.black54, fontSize: 10.0),
          ),
        ],
      ),
    );
  }

  Widget socialWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.facebookSquare),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.googlePlusSquare),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget signUpButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 350.0,
        height: 40.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'SIGN UP',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton(loginBloc) {
    return StreamBuilder(
        stream: loginBloc.submitStream,
        builder: (context, snapshot) {
          return InkWell(
            splashColor: Colors.blue,
            onTap: () {
              if (snapshot.hasData) {
                final snackBar = SnackBar(
                  content: Text(loginBloc.authValue()),
                  action: SnackBarAction(
                    label: 'Close',
                    onPressed: () {
                      Scaffold.of(context).hideCurrentSnackBar();
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackBar);
              }
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: 350.0,
              height: 40.0,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 10.0,
                color: snapshot.hasData ? Colors.blue : Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget logoWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget emailInputWidget(loginBloc) {
    return StreamBuilder(
        stream: loginBloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            height: 50.0,
            child: TextFormField(
              onChanged: loginBloc.emailChange,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.blueGrey,
                  ),
                ),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                errorText: snapshot.error,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget passwordInputWidget(loginBloc) {
    return StreamBuilder(
      stream: loginBloc.passwordStream,
      builder: (context, snapshot) {
        return Container(
          height: 50.0,
          child: TextFormField(
            onChanged: loginBloc.passwordChange,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.blueGrey,
                ),
              ),
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              errorText: snapshot.error,
              suffixIcon: IconButton(
                icon: eyeToggle
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    eyeToggle = !eyeToggle;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            obscureText: eyeToggle,
          ),
        );
      },
    );
  }
}
