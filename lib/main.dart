import 'package:bmicalculator/sizeconfig.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          elevation: 0.0,
          backgroundColor: Colors.deepOrange.shade600,
        ),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight / 4,
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade600,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Chip(
                  label: Text('data'),
                ),
                Chip(
                  label: Text('data'),
                ),
                Chip(
                  label: Text('data'),
                )
              ],
            ),
          ),
          Expanded(
            //TOMAKE: BUILD LAYOUT UTK TEXT INPUT FIELD
            child: Container(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
