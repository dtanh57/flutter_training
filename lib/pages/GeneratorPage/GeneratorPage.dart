import 'package:flutter/material.dart';
import 'package:namer_app/App.dart';
import 'package:namer_app/elements/BigCard.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;
    var favList = appState.favorites;
    var strings = AppLocalizations.of(context)!;
    String favText = strings.like;
    IconData icon = Icons.favorite_border;
    if (favList.contains(pair)) {
      icon = Icons.favorite;
      favText = strings.unlike;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: Icon(icon),
                onPressed: () {
                  appState.toogleFavorites();
                },
                label: Text(favText),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text(strings.next),
              ),
            ],
          )
        ],
      ),
    );
  }
}
