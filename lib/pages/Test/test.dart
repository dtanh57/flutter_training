import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final int index; // Add index as a class member
  const Test({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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
                          constraints: BoxConstraints(),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        middle: Text('Page 2 of tab $index'),
                      ),
                      child: Text('lon'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
