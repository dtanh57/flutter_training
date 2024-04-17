import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:namer_app/elements/app_bar_header.dart';
import 'package:namer_app/pages/UserDetails/user_details.dart';

class Users extends StatelessWidget {
  Future<List<dynamic>> fetchUsers() async {
    String apiUrl = 'https://jsonplaceholder.typicode.com/users';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  void onUserTap(BuildContext context, dynamic user) {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) {
          return UserDetails(user: user);
        },
      ),
    );
  }

  void deleteUser(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHeader(
        title: Text('User List'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchUsers, // Trigger fetchUsers() on refresh
        child: FutureBuilder<List<dynamic>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }
              // Data loaded successfully
              List<dynamic> users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      key: Key(users[index]['id'].toString()),
                      title: Text(users[index]['name']),
                      subtitle: Text(users[index]['email']),
                      onTap: () => onUserTap(context, users[index]));
                },
              );
            }),
      ),
    );
  }
}
