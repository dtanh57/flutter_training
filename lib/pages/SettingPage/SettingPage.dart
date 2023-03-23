import 'package:flutter/material.dart';
import 'package:namer_app/App.dart';
import 'package:namer_app/utils/modules/l10n/l10n.dart';
import 'package:namer_app/utils/modules/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localeState = context.watch<LocaleProvider>();
    var lang = localeState.locale ?? Localizations.localeOf(context);
    var strings = AppLocalizations.of(context)!;

    getTitle(String val) {
      switch (val) {
        case 'en':
          return Text(
            strings.english,
            style: TextStyle(fontSize: 16.0),
          );
        case 'ja':
          return Text(
            strings.japanese,
            style: TextStyle(fontSize: 16.0),
          );
        case 'vi':
          return Text(
            strings.vietnamese,
            style: TextStyle(fontSize: 16.0),
          );
        default:
          return Text(
            'English',
            style: TextStyle(fontSize: 16.0),
          );
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
              value: lang,
              onChanged: (Locale? val) {
                localeState.setLocale(val!);
              },
              items: L10n.all
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: getTitle(e.languageCode),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
