import 'package:flutter/material.dart';
import 'package:flutter_downloader_example/ads_service.dart';
import 'package:flutter_downloader_example/bst/Papers/paperh.dart';
import 'package:flutter_downloader_example/bst/marking/bstmarking.dart';
import 'package:flutter_downloader_example/bst/shortnote/bstshorthome.dart';
import 'package:flutter_downloader_example/bst/textbook/bsttxthome.dart';
import 'package:flutter_downloader_example/componets/custommenu.dart';
import 'package:flutter_downloader_example/componets/customtext.dart';
import 'package:flutter_downloader_example/group.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Bsthome extends StatefulWidget {
  const Bsthome({Key? key}) : super(key: key);

  @override
  _BsthomeState createState() => _BsthomeState();
}

class _BsthomeState extends State<Bsthome> {
  @override
  Widget build(BuildContext context) {
    Future<void> _launchInWebViewWithJavaScript(String urls) async {
      if (await canLaunch(urls)) {
        await launch(
          urls,
        );
      } else {
        throw 'Could not launch $urls';
      }
    }

    final platform = Theme.of(context).platform;
    return Scaffold(
      bottomNavigationBar: Container(
        color: HexColor("#29335C"),
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(1.0),
        child: AdWidget(
          key: UniqueKey(),
          ad: AdManager.createBannerAd()..load(),
        ),
      ),
      appBar: AppBar(
        backgroundColor: HexColor("#29335C"),
        actions: [
          Group(),
        ],
        title: Text(
          "Bio System Technology",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: HexColor("#FFFFFF"),
              fontSize: 20),
        ),
        centerTitle: true,
      ),
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
                height: 10,
              ),
              Customtext("Menu", FontWeight.w500, 30.0, HexColor("#011936")),
              Divider(
                thickness: 2,
                color: Colors.black,
              ),
              Custommenu(
                menuname: "Short Notes",
                imgname: "shortnote.png",
                page: Bstshort(
                  title: 'Bst Short Note',
                  platform: platform,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Custommenu(
                menuname: "Text Books",
                imgname: "txtbook.png",
                page: Bsttxthome(
                  title: 'Bst Text Book',
                  platform: platform,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Custommenu(
                menuname: "Papers",
                imgname: "paper.png",
                page: Paperhbst(
                  title: 'Bst papers',
                  platform: platform,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Custommenu(
                menuname: "Maeking Schemes",
                imgname: "marking.png",
                page: Bstmarking(
                  title: 'Bst Marking Schemes',
                  platform: platform,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
