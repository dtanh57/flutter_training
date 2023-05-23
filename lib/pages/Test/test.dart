import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/elements/app_bar_header.dart';

class Test extends StatelessWidget {
  final int index; // Add index as a class member
  const Test({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHeader(
        title: Text('Page 1 of tab $index'),
      ),
      body: Center(
        child: CupertinoButton(
          child: const Text('Next page'),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                      appBar: AppBarHeader(
                        title: Text('Page 2 of tab $index'),
                      ),
                      body: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Text that fills the row',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
