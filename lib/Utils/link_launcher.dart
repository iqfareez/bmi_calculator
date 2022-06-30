import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  ///  launch the given url
  static void launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      Fluttertoast.showToast(
          msg: "Cannot launch url $url", backgroundColor: Colors.red);
    }
  }
}
