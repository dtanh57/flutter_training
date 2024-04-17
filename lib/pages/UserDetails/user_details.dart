import 'package:flutter/material.dart';
import 'package:namer_app/elements/app_bar_header.dart';
import 'package:namer_app/utils/resources/common_function.dart';

class UserDetails extends StatelessWidget {
  final dynamic user;

  UserDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHeader(
        title: Text('User Details'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Utils.alertDialog(context,
                    title: 'Do you want to delete this user?',
                    content: 'Do you want to delete this user?',
                    onPressConfirm: Navigator.of(context).pop);
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${user['name']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Email: ${user['email']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
