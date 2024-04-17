import 'package:flutter/material.dart';
import 'package:namer_app/elements/app_bar_header.dart';
import 'package:namer_app/utils/modules/providers/locale_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String _selectedItem = 'en'; // Initially selected item

  List<String> _dropdownItems = [
    'en',
    'vi',
    'ja',
  ];

  @override
  Widget build(BuildContext context) {
    var localeState = context.watch<LocaleProvider>();
    return Scaffold(
      appBar: AppBarHeader(title: Text('Setting')),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedItem,
          onChanged: (String? newValue) {
            setState(() {
              _selectedItem = newValue!;
              print(newValue);
              localeState.setLocale(Locale(newValue));
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
