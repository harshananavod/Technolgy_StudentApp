import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader_example/ads_service.dart';
import 'package:flutter_downloader_example/bst/bsthome.dart';
import 'package:flutter_downloader_example/componets/customtext.dart';
import 'package:flutter_downloader_example/darawers.dart';
import 'package:flutter_downloader_example/etec/etechome.dart';
import 'package:flutter_downloader_example/sft/sfthome.dart';
import 'package:flutter_downloader_example/specialnote/specialhome.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import 'componets/custom_menu_button.dart';
import 'group.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("#29335C"),
            actions: [
              Group(),
            ],
            title: Text(
              "Home page",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: HexColor("#FFFFFF"),
                  fontSize: 20),
            ),
            centerTitle: true,
          ),
          drawer: Drawers(),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _launchInWebViewWithJavaScript(
                              "https://play.google.com/store/apps/details?id=com.ictapi.newpackagename");
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/p.jpg"),
                                fit: BoxFit.fill)),
                        height: 150,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Customtext(
                      "Subjects", FontWeight.w500, 30.0, HexColor("#011936")),
                  Divider(
                    thickness: 3,
                    color: HexColor("#29335C"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custommenubutton(
                    subname: "Science For Technology",
                    page: Sfthome(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custommenubutton(
                    subname: "Engineering Technology",
                    page: Etechome(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custommenubutton(
                    subname: "Bio System Technology",
                    page: Bsthome(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custommenubutton(
                    subname: "Technology Lesson Points",
                    page: Sph(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: HexColor("#29335C"),
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(1.0),
            child: AdWidget(
              key: UniqueKey(),
              ad: AdManager.createBannerAd()..load(),
            ),
          )),
    );
  }
}
