import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader_example/ads_service.dart';
import 'package:flutter_downloader_example/sft/sfthome.dart';
import 'package:flutter_downloader_example/specialnote/specialhome.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bst/bsthome.dart';
import 'etec/etechome.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);
  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'sciencefortechnology9@gmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

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
    return ElasticInLeft(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.white,
                ])),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            HexColor("#29335C"),
                            HexColor("#29335C")
                          ])),
                          child: Center(
                            child: Image(
                              image: AssetImage("images/seetings.png"),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            HexColor("#29335C"),
                            HexColor("#29335C")
                          ])),
                          child: Center(
                              child: Text(
                            "Technology අපි ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [HexColor("#29335C"), HexColor("#29335C")])),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Etechome(),
                              ));
                        },
                        leading: Icon(
                          Icons.pages,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Engineering technology",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bsthome(),
                              ));
                        },
                        leading: Icon(
                          Icons.pages,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Bio technology",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sfthome(),
                              ));
                        },
                        leading: Icon(
                          Icons.pages,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Science For technology",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sph(),
                              ));
                        },
                        leading: Icon(
                          Icons.pages,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Technology Master",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        onTap: () {
                          _launchInWebViewWithJavaScript(
                              "https://t.me/joinchat/tzmJ_QtEVQ0yYTNl");
                        },
                        leading: Icon(
                          Icons.group_add,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Join Group",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        onTap: () {
                          _launchURL();
                        },
                        leading: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Send massage",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: Icon(
                          Icons.exit_to_app_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Exit",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Container(
            color: HexColor("#29335C"),
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(1.0),
            child: AdWidget(
              key: UniqueKey(),
              ad: AdManager.createBannerAd()..load(),
            ),
          )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
