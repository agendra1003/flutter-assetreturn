import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Return Tracker',
      home: Scaffold(
        appBar: AppBar(title: Text('Asset Return')),
        body: Center(child: Text('Welcome to Asset Return App')),
      ),
    );
  }
}
