import 'package:bmicalculator/Utils/link_launcher.dart';
import 'package:bmicalculator/View/gauge_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../providers/bmi_provider.dart';
import 'input_data.dart';
import 'legendsTable.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bmiResult = Provider.of<BmiProvider>(context).bmiValue;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          // shadowColor: Colors.transparent,
          backgroundColor: Colors.pink.shade50,
          elevation: 0.0,
          bottom: const GaugeResult(),
          actions: [
            kIsWeb
                ? IconButton(
                    tooltip: 'Copy your BMI result',
                    icon: const Icon(Icons.copy_rounded),
                    onPressed: () {
                      Clipboard.setData(
                              ClipboardData(text: bmiResult.toString()))
                          .then((value) =>
                              Fluttertoast.showToast(msg: 'Done copy'));
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      if (bmiResult <= 0) {
                        Share.share(
                            'My BMI is $bmiResult\n\nDownload the app https://bit.ly/BMI-dl');
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Calculate your BMI first',
                            backgroundColor: Colors.red);
                      }
                    },
                    tooltip: 'Share your current BMI',
                  ),
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {
                showAppAboutDialog(context);
              },
              tooltip: 'View app information',
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              InputData(),
              SizedBox(height: 30),
              LegendsDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  void showAppAboutDialog(BuildContext context) {
    return showAboutDialog(
      context: context,
      applicationName: 'BMI Calculator Lite',
      applicationVersion: '1.2.11+5',
      applicationIcon: SvgPicture.asset(
        'assets/app-logo.svg',
        height: 55,
        width: 55,
      ),
      applicationLegalese: 'Copyright © Fareez Iqmal 2021',
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'This app was created for fun during the Covid-19 pandemic.',
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          kIsWeb ? 'Hosted on Firebase' : '☆*: .｡. o(≧▽≦)o .｡.:*☆',
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
            onPressed: () {
              LinkLauncher.launch('https://github.com/iqfareez/bmi_calculator');
            },
            child: const Text("View code on GitHub")),
        kIsWeb
            ? OutlinedButton.icon(
                onPressed: () {
                  LinkLauncher.launch(
                      'https://play.google.com/store/apps/details?id=live.iqfareez.bmicalculator');
                },
                icon: const Icon(Icons.picture_as_pdf_sharp),
                label: const Text("Get app from Google Play Store"))
            : OutlinedButton(
                onPressed: () {
                  LinkLauncher.launch('https://bmi-flutter-2e776.web.app/');
                },
                child: const Text("Open app online")),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  LinkLauncher.launch('url:https://www.twitter.com/iqfareez');
                },
                icon: SvgPicture.asset('assets/twitter-logo.svg')),
            IconButton(
                onPressed: () {
                  LinkLauncher.launch('url:https://iqfareez.com');
                },
                icon: SvgPicture.asset('assets/chrome-logo.svg'))
          ],
        ),
      ],
    );
  }
}
