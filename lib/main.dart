// ignore_for_file: prefer_const_constructors

import 'package:dinamik_not_hesaplama/Consts/consts.dart';
import 'package:dinamik_not_hesaplama/widgets/homapage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "gotham",
        primarySwatch: Consts.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Material App',
      home: HomaPage(),
    );
  }
}
