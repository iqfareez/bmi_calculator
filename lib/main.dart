import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'AppBody.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
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
              Share.share('Not implemented yet :")');
            },
            tooltip: 'Share your current BMI',
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              print('Info');
              showAboutDialog(
                  context: context,
                  applicationName: 'BMI Calculator Lite',
                  applicationVersion: '1.0.0-pre+1',
                  applicationIcon: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/bmi-flutter-2e776.appspot.com/o/logounnamed%20(Custom).png?alt=media&token=b22b53f7-bfc6-4a9b-89f3-92e681d1fe6c',
                    width: 50,
                  ),
                  applicationLegalese: '© maplerr aka fareez');
            },
            tooltip: 'View some info',
          )
        ],
      ),
      body: AppBody(),
    );
  }
}
