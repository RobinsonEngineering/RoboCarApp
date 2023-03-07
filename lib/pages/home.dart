
import 'package:characterization/components/appbar.dart';
import 'package:characterization/constants.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:characterization/pages/settings.dart';
import 'package:flutter/material.dart';

import '../components/table.dart';
import '../components/table_manager.dart';

class Home extends StatelessWidget {
  String password = "";

  double start = -0.95;
  double spacing = 0.22;

  List<double> initTables() {
    List<double> tableY = List.filled(TableManager().GetNumberTables(), 1.0);
    for (int i = 0; i < tableY.length; ++i) {
      tableY[i] = start + spacing * i;
    }
    return tableY;
  }

  List<double> zeros = List.filled(TableManager().GetNumberTables(), 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: SushiTable(
            xs: [-0.4, -0.4, 0.0, 0.0, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.55, 0.55, 0.55, 0.55, 0.55, 0.55],
            ys: [-1.0, -0.87, -1.0, -0.87, -0.55, -0.23, 0.05, 0.35, 0.62, 0.9, -0.8, -0.45, 0.05, 0.45, 0.77, 1.0],
            thetas: zeros,
            lefts: ["16", "01", "15", "02", "03", "04", "05", "06", "07", "08", "14", "13", "12", "11", "10", "09"],
            rights: ["", ""],
          ),
    );
  }
}