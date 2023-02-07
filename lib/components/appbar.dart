

import 'dart:async';

import 'package:characterization/constants.dart';
import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import '../components/socket.dart';
import '../pages/home.dart';


class Appbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  String message = "000000000000";
  String password = "";
  int battery = 0;
  List<int> batteries = <int>[0];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      setState(() {update(1);});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
  }

  void update(int test) {
    setState(() {
      String code = SSocket().getArduinoCode();
      if (code.length > 6 && !code.contains("test")) {
        print("arduino code: " + message);
        message = code;
      }
      int temp = int.parse(message.substring(7, 10));
      if (temp != 0) {
        batteries.add(temp);
      }
      if (batteries.length > 50000) {
        batteries.removeAt(0);
      }
      battery = 0;
      for (int element in batteries) {
        battery += element;
      }
      battery = (battery / batteries.length).round();
    });
  }
  
  @override
  Widget build(BuildContext context) {
      return AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 100, 0),
                child: Center(
                    child: (() {
                      if (int.parse(message.substring(1, 2)) == 1) {
                        return Row(
                            children: [
                              Text(
                                  "Running",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                  )
                              ),
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 28,
                              )
                            ]
                        );
                      } else {
                        return Row(
                            children: [
                              Text(
                                  "Not Running",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22
                                  )
                              ),
                              Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 28,
                              )
                            ]
                        );
                      };
                    })()
                )
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }

              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: kBackgroundColor,
                            title: Text('Enter password', style: TextStyle(color: Colors.white)),
                            content: TextField(
                              onChanged: (value) {
                                password = value;

                              },
                              // controller: _textFieldController,
                              decoration: InputDecoration(
                                  hintText: "password",
                                  hintStyle: TextStyle(color: Colors.white)
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                color: kPrimaryColor,
                                textColor: Colors.white,
                                child: Text('OK'),
                                onPressed: () {
                                  if (password == "admin") {
                                    print(password);
                                    password = "";
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Settings()));
                                  }
                                },
                              ),

                            ],
                          );
                        }
                    );
                  }

              ),
            ),

          ],
          title: Center(
            child: Text(
                (() { return "Battery: " + battery.toString() + "%"; })(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                )
            ),
          )
      );
  }
}