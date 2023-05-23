import 'package:flutter/material.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool? centerTitle;
  final List<Widget>? actions;
  const AppBarHeader(
      {super.key, required this.title, this.centerTitle, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set the same fixed background color
        ),
      ),
      centerTitle: centerTitle,
      // Add any additional AppBar components, such as actions or leading widgets
      actions: actions,
      elevation: 1.5,
      shadowColor: Colors.grey,
    );
  }
}
