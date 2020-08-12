import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'Utils/RegExInputFormatter.dart';
import 'Utils/sizeconfig.dart';
import 'View/legendsTable.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

double calculateBMI({String weight, String height}) {
  double _weight;
  double _height;

  try {
    _weight = double.parse(weight);
    _height = double.parse(height);
  } on FormatException {
    print('Invalid format');
  }

  var result = (_weight / pow(_height, 2));
  print('result is $result');
  return result;
}

class _AppBodyState extends State<AppBody> {
  final _amountValidator = RegExInputFormatter.withRegex(
      '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$');
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final snackBar = SnackBar(
    content: Text('Cannot calculate\nOne or more field is empty'),
    duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight / 3,
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade600,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {
                        print('Prssed info');
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '28',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
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
                          inputFormatters: [_amountValidator],
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
                          inputFormatters: [_amountValidator],
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
                          if (weightController.text == "" ||
                              heightController.text == "") {
                            Scaffold.of(context).showSnackBar(snackBar);
                          } else {
                            calculateBMI(
                                height: heightController.text,
                                weight: weightController.text);
                          }
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

//TODO: letak info icon kat toolbar
//TODO: Share icon as fab
//TODO: Letak funtion reset
