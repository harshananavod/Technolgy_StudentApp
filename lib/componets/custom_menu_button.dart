import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader_example/componets/customtext.dart';


import 'package:hexcolor/hexcolor.dart';

class Custommenubutton extends StatelessWidget {
  const Custommenubutton({
    this.page,
    this.subname,
    Key? key,
  }) : super(key: key);
  final subname;
  final page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor("#29335C")),
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Customtext(
                    subname, FontWeight.w500, 20.0, HexColor("#FFFFFF")),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Image.asset("images/go.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
