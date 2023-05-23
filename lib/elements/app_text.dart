import 'package:flutter/material.dart';
import 'package:namer_app/utils/resources/app_dimens.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const AppText({super.key, required this.text, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
                fontSize: AppDimens.bodyLarge,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
                color: Colors.black)
            .merge(style));
  }
}
