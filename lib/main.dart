import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('  BMI Calculator'),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          actions: [
            kIsWeb
                ? IconButton(
                    tooltip: 'Copy your BMI result',
                    icon: Icon(Icons.copy_rounded),
                    onPressed: () {
                      Clipboard.setData(
                              ClipboardData(text: bmiResult.toString()))
                          .then((value) =>
                              Fluttertoast.showToast(msg: 'Done copy'));
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      print('Pressed');
                      if (bmiResult != null) {
                        Share.share('My BMI is $bmiResult');
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Calculate your BMI first',
                            backgroundColor: Colors.red);
                      }
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
                    applicationVersion: '1.0.3+3',
                    applicationIcon: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/bmi-flutter-2e776.appspot.com/o/logounnamed%20(Custom).png?alt=media&token=b22b53f7-bfc6-4a9b-89f3-92e681d1fe6c',
                      width: 50,
                    ),
                    applicationLegalese: '© maplerr 2021',
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'This app is made for fun by me during Covid-19 pandemic.\nMade with Flutter.\nHosted on Firebase.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      aboutLinkButton(
                          title: "View code on GitHub",
                          url:
                              'https://github.com/iqfareez/bmi_calculator-Flutter'),
                      aboutLinkButton(
                          title: 'My Twitter',
                          url: 'https://twitter.com/iqfareez2'),
                      kIsWeb
                          ? GestureDetector(
                              child: Image.asset(
                                'assets/google-play-badge.png',
                              ),
                              onTap: () {
                                _launchURL(
                                    'https://play.google.com/store/apps/details?id=live.iqfareez.bmicalculator');
                              },
                            )
                          : aboutLinkButton(
                              title: 'Open on web',
                              url: 'https://bmi-flutter-2e776.web.app/')
                    ]);
              },
              tooltip: 'View some info',
            )
          ],
        ),
        body: AppBody(),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget aboutLinkButton({String title, String url}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: OutlineButton(
      child: Text(title),
      onPressed: () {
        _launchURL(url);
      },
    ),
  );
}
