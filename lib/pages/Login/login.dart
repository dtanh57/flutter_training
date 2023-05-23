import 'package:flutter/material.dart';
import 'package:namer_app/pages/HomePage/HomePage.dart';
import 'package:namer_app/pages/Register/register.dart';
import 'package:namer_app/utils/resources/app_dimens.dart';
import 'package:namer_app/utils/resources/common_function.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userName = '';
  String _password = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint(_userName);
      debugPrint(_password);
      /* 
      Continute proccessing the provided information with your own logic 
      such us sending HTTP requests, savaing to SQLite database, etc.
      */
      if (_userName == '1234' && _password == '1234') {
        Navigation.pushReplacement(context, HomePage());
      }
    }
  }

  void _goToSignUp() {
    Navigation.push(context, Register());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 80),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 35),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: AppDimens.titleLarge,
                                fontWeight: FontWeight.bold),
                          ),

                          /// username
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Username'),
                            validator: (value) => Validation.userName(value),
                            onChanged: (value) => _userName = value,
                          ),

                          /// Password
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) => Validation.password(value),
                            onChanged: (value) => _password = value,
                          ),
                          SizedBox(height: 20),
                          Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  // padding: EdgeInsets.symmetric(vertical: 5),
                                  // constraints: BoxConstraints(),
                                  onPressed: _goToSignUp,
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                          Container(
                              alignment: Alignment.center,
                              child: OutlinedButton(
                                  onPressed: _trySubmitForm,
                                  child: Text('Sign in')))
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
