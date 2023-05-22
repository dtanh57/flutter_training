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
