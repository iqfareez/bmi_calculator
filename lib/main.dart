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
                Text(
                  'Your BMI is HEALTHY',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 23.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Weight (kg)",
                              hintText: "Eg: 57.2",
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Height (cm)",
                              hintText: "Eg: 159.2",
                              alignLabelWithHint: false,
                              filled: true),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Legends:\n',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '• Less than',
                                ),
                                TextSpan(
                                    text: ' 16.0 - ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Severely Underweight\n',
                                ),
                                TextSpan(
                                  text: '• From',
                                ),
                                TextSpan(
                                    text: ' 16.0 to 18.5 - ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Underweight\n',
                                ),
                                TextSpan(
                                  text: '• From',
                                ),
                                TextSpan(
                                    text: ' 18.6 to 25.0 - ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Normal Weight\n',
                                ),
                                TextSpan(
                                  text: '• From',
                                ),
                                TextSpan(
                                    text: ' 25.1 to 30.0 - ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Overweight\n',
                                ),
                                TextSpan(
                                  text: '• From',
                                ),
                                TextSpan(
                                    text: ' 30.1 to 35.0 - ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Moderately Obese\n',
                                ),
                                TextSpan(
                                  text: '• More than',
                                ),
                                TextSpan(
                                    text: ' 35.0 - ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: 'Severely Obese\n',
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//TODO: letak share icon kat toolbar
//TODO: Letak calculate/reset button
