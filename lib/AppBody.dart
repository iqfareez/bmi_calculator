import 'dart:math';

import 'package:flutter/material.dart';

import 'Utils/sizeconfig.dart';
import 'View/legendsTable.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

double calculateBMI(double weight, double height) {
  return (weight / pow(height, 2));
}

class _AppBodyState extends State<AppBody> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

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
                Text(
                  'Your BMI is HEALTHY',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 23.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: weightController,
                          maxLength: 4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Weight ",
                              counter: Offstage(),
                              hintText: "Eg: 57.2",
                              suffixText: "kg",
                              alignLabelWithHint: false,
                              filled: true),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: heightController,
                          maxLength: 4,
                          decoration: InputDecoration(
                              counter: Offstage(),
                              border: OutlineInputBorder(),
                              labelText: "Height",
                              hintText: "Eg: 1.7",
                              suffixText: "m",
                              alignLabelWithHint: false,
                              filled: true),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          "CALCULATE",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          print('Button calculate pressed');
                          print('height is ' + heightController.text);
                          print('weight is ' + weightController.text);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          "RESET",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () {
                          print('Button reset pressed');
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
                LegendsTable(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//TODO: letak share icon kat toolbar
//TODO: Letak funtion reset
