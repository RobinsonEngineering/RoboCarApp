
import 'package:characterization/constants.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import '../components/is_running.dart';
import '../components/table.dart';

class Home extends StatelessWidget {
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          actions: [
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 100, 0),
                child: Center(
                    child: IsRunning()
                )
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Home()));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
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
                "ROBO CAR",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                )
            ),
          )
      ),
      body: SushiTable(
        xs: [-0.1, -0.1, -0.1, -0.1, -0.1, -0.1],
        ys: [-0.9, -0.55, -0.2, 0.15, 0.5, 0.85],
        thetas: [0.0, 0.0 ,0.0, 0.0, 0.0, 0.0],
        lefts: ["06", "05", "04","03","02","01"],
        rights: ["16", "15", "14","13","12","11"],
      )
    );
  }
}