import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:namer_app/pages/AboutUs/about_us.dart';
import 'package:namer_app/pages/Favorite/favorite.dart';
import 'package:namer_app/pages/Generator/generator.dart';
import 'package:namer_app/pages/Products/products.dart';
import 'package:namer_app/pages/SettingPage/setting.dart';
import 'package:namer_app/pages/Users/users.dart';

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
    var strings = AppLocalizations.of(context)!;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: strings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: strings.purchase_history,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: strings.home,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: strings.favorite,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Users',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.vape_free),
          //   label: 'About us',
          // ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: strings.setting),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Products(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FavoritesPage(),
              );
            });
          // case 0:
          //   return CupertinoTabView(builder: (context) {
          //     return CupertinoPageScaffold(
          //       child: GeneratorPage(),
          //     );
          //   });
          // case 1:
          //   return CupertinoTabView(builder: (context) {
          //     return CupertinoPageScaffold(
          //       child: FavoritesPage(),
          //     );
          //   });
          // case 2:
          //   return CupertinoTabView(builder: (context) {
          //     return Users();
          //   });
          // case 3:
          //   return CupertinoTabView(builder: (context) {
          //     return CupertinoPageScaffold(
          //       child: AboutUs(),
          //     );
          //   });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SettingPage(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: GeneratorPage(),
              );
            });
        }
      },
    );
  }
}
