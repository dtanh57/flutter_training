import 'dart:ffi';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/App.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    List<WordPair> favList = appState.favorites;

    return SafeArea(
      child: favList.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You don\'t have a favorite word. Please like some words.',
                    textAlign: TextAlign.center,
                  ),
                ],
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
                          onPressed: () => {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                title: Text(item.value.asLowerCase),
                                content: Text('Do you want to unlike it?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      appState.unLike(item.value);
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          },
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
