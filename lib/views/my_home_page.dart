import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../shared/utils/link_launcher.dart';
import '../providers/bmi_provider.dart';
import 'gauge_result.dart';
import 'input_data.dart';
import 'legends_data_table.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                if (bmiResult > 0) {
                  String message =
                      'My BMI is ${bmiResult.toStringAsFixed(2)}\n\nDownload the ';

                  message += kIsWeb
                      ? 'web https://go.iqfareez.com/bmiWeb'
                      : 'app https://go.iqfareez.com/bmiDL';
                  SharePlus.instance.share(ShareParams(
                    text: message,
                    subject: 'My BMI Result',
                  ));
                } else {
                  HapticFeedback.lightImpact();
                  Fluttertoast.showToast(
                      msg: 'Calculate your BMI first',
                      webBgColor: "linear-gradient(to right, #642B73, #C6426E)",
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
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputData(),
              SizedBox(height: 30),
              LegendsDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  void showAppAboutDialog(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return showAboutDialog(
      context: context,
      applicationName: 'BMI Calculator Lite',
      applicationVersion: 'v${packageInfo.version}',
      applicationIcon: SvgPicture.asset(
        'assets/app-logo.svg',
        height: 55,
        width: 55,
      ),
      applicationLegalese: 'Copyright © Fareez Iqmal 2025',
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'This app was created for fun during the Covid-19 pandemic.',
            textAlign: TextAlign.center,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.github,
              size: 24,
            ),
            tooltip: 'View source code on GitHub',
            onPressed: () {
              LinkLauncher.launch('https://github.com/iqfareez/bmi_calculator');
            },
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.xTwitter,
              size: 24,
            ),
            tooltip: 'Follow me on X (@iqfareez)',
            onPressed: () {
              LinkLauncher.launch('https://www.twitter.com/iqfareez');
            },
          ),
          if (!kIsWeb)
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.chrome,
                size: 24,
              ),
              tooltip: 'Open app as Web App',
              onPressed: () {
                LinkLauncher.launch('https://bmi-flutter-2e776.web.app/');
              },
            )
          else
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.android,
                size: 24,
              ),
              tooltip: 'Open Android App',
              onPressed: () {
                LinkLauncher.launch(
                    'https://play.google.com/store/apps/details?id=live.iqfareez.bmicalculator');
              },
            ),
        ]),
      ],
    );
  }
}
