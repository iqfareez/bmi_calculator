import 'package:flutter/material.dart';

import 'AppBody.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator ',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade600,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('Pressed');
            },
            tooltip: 'Share your current BMI',
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              print('Info');
              showAboutDialog(context: context);
            },
            tooltip: 'View some info',
          )
        ],
      ),
      body: AppBody(),
    );
  }
}
