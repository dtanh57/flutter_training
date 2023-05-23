import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });
  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: TextStyle(fontSize: 40),
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
