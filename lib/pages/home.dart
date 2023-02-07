
import 'package:characterization/components/appbar.dart';
import 'package:characterization/constants.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import '../components/table.dart';

class Home extends StatelessWidget {
  String password = "";

  double start = -0.95;
  double spacing = 0.22;

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
      appBar: Appbar(),
      body: SushiTable(
            xs: [-0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0],
            ys: initTables(),
            thetas: [0.0, 0.0 ,0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
            lefts: ["08","07", "06", "05", "04","03","02","01"],
            rights: ["18","17", "16", "15", "14","13","12","11"],
          ),
    );
  }
}