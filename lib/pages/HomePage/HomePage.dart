// import 'package:flutter/material.dart';
// import 'package:namer_app/pages/AboutUs/AboutUs.dart';
// import 'package:namer_app/pages/FavoritesPage/FavoritesPage.dart';
// import 'package:namer_app/pages/GeneratorPage/GeneratorPage.dart';
// import 'package:namer_app/pages/SettingPage/SettingPage.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     var strings = AppLocalizations.of(context)!;
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = GeneratorPage();
//         break;
//       case 1:
//         page = FavoritesPage();
//         break;
//       case 2:
//         page = SettingPage();
//         break;
//       case 3:
//         page = AboutUs();
//         break;
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }

//     return Scaffold(
//       body: Row(
//         children: [
//           SafeArea(
//             child: NavigationRail(
//               extended: false,
//               destinations: [
//                 NavigationRailDestination(
//                   icon: Icon(Icons.home),
//                   label: Text(strings.home),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.favorite),
//                   label: Text(strings.favorite),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.settings),
//                   label: Text(strings.setting),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(Icons.vape_free),
//                   label: Text(strings.setting),
//                 ),
//               ],
//               selectedIndex: selectedIndex,
//               onDestinationSelected: (value) {
//                 setState(() {
//                   selectedIndex = value;
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Theme.of(context).colorScheme.primaryContainer,
//               child: page,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:namer_app/pages/AboutUs/AboutUs.dart';

class TabScaffoldApp extends StatelessWidget {
  const TabScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                leading: RawMaterialButton(
                                  padding: EdgeInsets.zero,
                                  child: Icon(Icons.arrow_back),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                middle: Text('Page 2 of tab $index'),
                              ),
                              child: AboutUs());
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
