
import 'package:characterization/constants.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import '../components/is_running.dart';
import '../components/table.dart';

class Home extends StatelessWidget {
  String password = "";

  double start = -0.95;
  double spacing = 0.27;

  List<double> initTables() {
    List<double> tableY = List.filled(8, 1.0);
    for (int i = 0; i < tableY.length; ++i) {
      tableY[i] = start + spacing * i;
    }
    return tableY;
  }

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
                "Battery: 96%",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                )
            ),
          )
      ),
      body: SushiTable(
        xs: [-0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1, -0.1],
        ys: initTables(),
        thetas: [0.0, 0.0 ,0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
        lefts: ["08","07", "06", "05", "04","03","02","01"],
        rights: ["18","17", "16", "15", "14","13","12","11"],
      )
    );
  }
}