import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/App.dart';
import 'package:namer_app/elements/app_bar_header.dart';
import 'package:namer_app/elements/app_text.dart';
import 'package:namer_app/utils/resources/common_function.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    List<WordPair> favList = appState.favorites;

    return Scaffold(
      appBar: AppBarHeader(title: Text('Favorite')),
      body: favList.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: AppText(
                text:
                    'You don\'t have a favorite word. Please like some words.',
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: favList.asMap().entries.map((item) {
                  return Container(
                    clipBehavior: Clip.none,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${item.key + 1}'),
                              SizedBox(width: 12),
                              Expanded(child: Text(item.value.asLowerCase))
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => Utils.alertDialog(context,
                              title: item.value.asLowerCase,
                              content: 'Do you want to unlike it?',
                              onPressConfirm: () =>
                                  appState.unLike(item.value)),
                          icon: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
