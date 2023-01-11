import 'dart:io';

import 'package:characterization/components/is_running.dart';
import 'package:characterization/components/table.dart';
import 'package:characterization/pages/home.dart';
import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Characterization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: kBackgroundColor,
        drawerTheme: DrawerThemeData(
          backgroundColor: kPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor
        )
      ),
      home: Home()
    );
  }
}