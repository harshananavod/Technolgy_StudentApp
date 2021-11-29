import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  const Customtext(this.t, this.w, this.s, this.c);
  final t;
  final w;
  final s;
  final c;

  @override
  Widget build(BuildContext context) {
    return Text(
      t,
      style: TextStyle(color: c, fontSize: s, fontWeight: w),
    );
  }
}
