import 'package:flutter/material.dart';
import 'package:namer_app/pages/AboutUs/AboutUs.dart';
import 'package:namer_app/pages/FavoritesPage/FavoritesPage.dart';
import 'package:namer_app/pages/GeneratorPage/GeneratorPage.dart';
import 'package:namer_app/pages/SettingPage/SettingPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var strings = AppLocalizations.of(context)!;
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = SettingPage();
        break;
      case 3:
        page = AboutUs();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text(strings.home),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text(strings.favorite),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text(strings.setting),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.vape_free),
                  label: Text(strings.setting),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
