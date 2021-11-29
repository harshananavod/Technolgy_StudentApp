import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);
   Future<void> _launchInWebViewWithJavaScript(String urls) async {
    if (await canLaunch(urls)) {
      await launch(
        urls,
      );
    } else {
      throw 'Could not launch $urls';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.group,
        size: 30,
      ),
      onPressed: () {
        _launchInWebViewWithJavaScript(
            "https://t.me/joinchat/tzmJ_QtEVQ0yYTNl");
      },
    );
  }
}
