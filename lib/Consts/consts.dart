import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  //renkler
  static const anaRenk = Colors.indigo;
  static final appBarBackgroundColor = Colors.transparent.withOpacity(0);
  static final textFormFieldBackGround = Colors.grey.withOpacity(0.2);

  //text
  static const String appBarTitleText = "Dinamik Ortalama Hesaplama";

  //textStyle
  static final appBarTitleTextStyle = GoogleFonts.quicksand(
      color: anaRenk,
      textStyle: TextStyle(
        fontFamily: "Gotham",
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ));

  static final OrtalamaGosterTitleTextStyle = GoogleFonts.quicksand(
      color: anaRenk,
      textStyle: TextStyle(
        fontFamily: "Gotham",
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ));

  static final NotTitleTextStyle = GoogleFonts.quicksand(
      color: anaRenk,
      textStyle: TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w600,
      ));

  static final hintStyleText =
      TextStyle(color: Color.fromARGB(255, 124, 123, 123).withOpacity(0.3));

  static final labelStyleText =
      TextStyle(color: Color.fromARGB(255, 33, 33, 33).withOpacity(0.7));

  // radius

  static final BorderRadius borderRadius = BorderRadius.circular(20);
  static final BorderRadius dropDownRadius = BorderRadius.circular(12);
}
