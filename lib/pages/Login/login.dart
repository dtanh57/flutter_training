import 'package:flutter/material.dart';
import 'package:namer_app/pages/HomePage/HomePage.dart';
import 'package:namer_app/utils/resources/app_dimens.dart';
import 'package:namer_app/utils/resources/common_function.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGIN',
                style: TextStyle(
                    fontSize: AppDimens.titleLarge,
                    fontWeight: FontWeight.bold)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Xử lý logic đăng nhập ở đây
                String email = _emailController.text;
                String password = _passwordController.text;
                // Gọi API, kiểm tra thông tin đăng nhập, v.v.

                Navigation.pushReplacement(context, HomePage());
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
