import 'package:characterization/server/network_button.dart';
import 'package:characterization/server/speed_widget.dart';
import 'package:flutter/material.dart';
import 'package:characterization/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(          // MODIFY with const
      title: 'Characterization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: kBackgroundColor,
        drawerTheme: const DrawerThemeData(
          backgroundColor: kPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor
        )
      ),
      // home: Main(),
      home: Scaffold(
        appBar: AppBar(
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
        body:
          // Main()
          Test()
      )
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            // child: Row(
            //   children: [
            //     Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 5, 5),
                    child: Card(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: SpeedWidget()
                            )
                          ]
                        )
                      )
                    ),
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
                    child: Card(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [

                          ]
                        )
                      )
                    ),
                  // )
                // )
              // ]
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
                    child: Card(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [

                          ]
                        )
                      )
                    ),
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
                    child: Card(
                      color: kPrimaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [

                          ]
                        )
                      )
                    ),
                  )
                )
              ]
            ),
          ),
        ]
      )
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Container()
          ),
          Expanded(
            child: Card(
                color: kPrimaryColor,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: NetworkButton()
                )
            ),
          ),
          Expanded(
            child: Container()
          ),
        ],
      )
    );
  }
}
