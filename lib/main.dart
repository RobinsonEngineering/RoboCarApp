import 'dart:io';

import 'package:characterization/is_running.dart';
import 'package:characterization/table.dart';
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
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Center(
                child: IsRunning()
              )
            )
          ],
          title: Center(
            child: Text(
              "ROBO CAR",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22
              )
            ),
          )
        ),
        drawer: Drawer(),
        body: Main()
      )
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SushiTable(x: -0.1, y: -0.2, theta: -90, left: "04", right: "14"),
        SushiTable(x: -0.1, y: 0.4, theta: -90, left: "03", right: "13"),
        SushiTable(x: -0.1, y: 1.0, theta: -90, left: "02", right: "12"),
        SushiTable(x: -0.1, y: 1.6, theta: -90, left: "01", right: "11")
      ]
    );
  }
}