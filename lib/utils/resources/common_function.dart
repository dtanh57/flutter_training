import 'package:flutter/material.dart';

class Navigation {
  static pushReplacement(context, Widget widget) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => widget),
    );
  }

  static push(context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => widget),
    );
  }
}

class Utils {
  static void alertDialog(BuildContext context,
      {String? title,
      String? content,
      String? textCancel,
      String? textConfirm,
      Function? onPressCancel,
      Function? onPressConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: Text(title ?? 'Default Title'),
          content: Text(content ?? 'Default Content'),
          actions: [
            ElevatedButton(
              child: Text(textCancel ?? 'Cancel'),
              onPressed: () {
                if (onPressCancel != null) {
                  onPressCancel();
                }
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(textConfirm ?? 'Confirm'),
              onPressed: () {
                if (onPressConfirm != null) {
                  onPressConfirm();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Validation {
  static userName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 4) {
      return 'Username must be at least 4 characters in length';
    }
    // Return null if the entered username is valid
    return null;
  }

  static password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 4) {
      return 'Password must be at least 8 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }
}
