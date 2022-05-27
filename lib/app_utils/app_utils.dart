import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        content: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text("Please wait..."),
          ],
        ),
      ),
    );
  }

  Future<void> urlLaunch(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
