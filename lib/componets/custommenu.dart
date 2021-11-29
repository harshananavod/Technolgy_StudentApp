import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader_example/componets/customtext.dart';


import 'package:hexcolor/hexcolor.dart';

class Custommenu extends StatelessWidget {
  const Custommenu({
    this.menuname,
    this.imgname,
    this.page,
    Key? key,
  }) : super(key: key);
  final menuname;
  final imgname;
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
        height: 120,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 34),
                child: Customtext(
                    menuname, FontWeight.w500, 20.0, HexColor("#FFFFFF")),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage("images/$imgname"))),
              height: 120,
              width: 140,
            )
          ],
        ),
      ),
    );
  }
}
