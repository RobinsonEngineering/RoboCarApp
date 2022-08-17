import 'package:characterization/server/network_button.dart';
import 'package:flutter/material.dart';
import 'package:characterization/components/h_card.dart';
import 'package:characterization/components/h_scaffold.dart';
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
        body: Center(
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
        )
      )
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HScaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.5))
                        ),
                        elevation: 5,
                        child: Container()
                      )
                    )
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.5))
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: HChart(
                            xAxis: [1, 2, 3, 4],
                            yAxis: [[1, 5, 3, 6]],
                            maxY: 10,
                            // colors: [Color(0xFFd189f0)],
                            colors: [kSecondaryColor],
                          )
                        )
                      )
                    )
                  ),
                ],
              )
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: kFadedColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.5))
                        ),
                        elevation: 5,
                        child: Container()
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: kFadedColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.5))
                        ),
                        elevation: 5,
                        child: Container()
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        color: kFadedColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.5))
                        ),
                        elevation: 5,
                        child: Container()
                      )
                    ),
                  )
                ]
              )
            ),
          ]
        )
      )
    );
  }
}
