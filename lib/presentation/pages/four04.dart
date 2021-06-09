import 'package:flutter/material.dart';

class Four04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not found...'),),
      body: Center(
          child:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.warning, size: 96, color: Colors.orange),
            Text('404', style: Theme.of(context).textTheme.headline1),
            Text('Page not found...'),
            Text('😬', style: TextStyle(fontSize: 72)),
          ])
      ),
    );
  }
}
