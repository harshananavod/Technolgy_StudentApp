import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader_example/componets/customtext.dart';
import 'package:flutter_downloader_example/homepage.dart';
import 'package:hexcolor/hexcolor.dart';

class Spalashscreen extends StatefulWidget {
  const Spalashscreen({Key? key}) : super(key: key);

  @override
  _SpalashscreenState createState() => _SpalashscreenState();
}

class _SpalashscreenState extends State<Spalashscreen> {
  void initState() {
    super.initState();
    _navigatortohome();
  }

  _navigatortohome() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#29335C"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spin(
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/seetings.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: BounceInUp(
                child: Customtext("Technology අපි ", FontWeight.w500, 30.0,
                    HexColor("#FFFFFF")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
