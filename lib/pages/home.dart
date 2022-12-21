

import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import '../components/is_running.dart';
import '../components/table.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
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
        xs: [-0.1, -0.1, -0.1, -0.1],
        ys: [-0.2, 0.4, 1.0, 1.6],
        thetas: [-90, -90, -90, -90],
        lefts: ["04","03","02","01"],
        rights: ["14","13","12","11"],
      )
    );
  }
}