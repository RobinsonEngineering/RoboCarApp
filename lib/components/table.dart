import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:characterization/components/socket.dart';
import 'package:characterization/components/table_manager.dart';
import 'package:characterization/constants.dart';
import 'package:characterization/components/server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SushiTable extends StatefulWidget {
  SushiTable({Key? key, this.xs, this.ys, this.thetas, this.lefts, this.rights}) : super(key: key);

  List? xs;
  List? ys;
  List? thetas;
  List? lefts;
  List? rights;

  @override
  State<SushiTable> createState() => _SushiTableState(xs, ys, thetas, lefts, rights);
}

class _SushiTableState extends State<SushiTable> {
  _SushiTableState(this.xs, this.ys, this.thetas, this.lefts, this.rights);

  List? xs;
  List? ys;
  List? thetas;
  List? lefts;
  List? rights;

  List<String> names = List.filled(8, "");



  int value = 2;

  int selection = 0;
  String circleSelection = "";

  void ResetNames() {
    for (int index = 0; index < 8; ++index) {
      names[index] = TableManager().getName(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    ResetNames();
    Border boxSelected(int s, int i) => (s == i ? Border.all(
        color: Colors.orangeAccent,
        width: 3
    ) : Border.all(width: 0, color: kBackgroundColor));
    BorderSide circleSelected(String s, String i) => (s == i ? BorderSide(
        color: Colors.orangeAccent,
        width: 3
    ) : BorderSide(width: 0, color: kBackgroundColor));

    List<Widget> widgets = List.filled(xs!.length + 3, Center());
    print(selection);
    for (int index = 0; index < this.xs!.length; ++index) {
      widgets[index] = (Align(
          alignment: Alignment(xs![index], ys![index]),
          child: Container(
              height: 100,
              width: 275,
              // transform: new Matrix4.identity()..rotateZ(thetas![index] * pi / 180),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        SSocket().setX(lefts![index]);
                        print("table: " + lefts![index]);
                        select(index, lefts![index]);
                      },
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(
                        side: circleSelected(circleSelection, lefts![index])
                      ),
                    ),
                    Container(
                        width: 60,
                        height: 60,
                        // transform: new Matrix4.identity()..rotateZ(theta!),
                        child: Card(
                          color: kPrimaryColor,
                          child: Center(
                            child: Text(
                              TableManager().getName(index),
                              style: TextStyle(
                                color: Colors.white
                              )
                            )
                          )
                        ),
                        decoration: BoxDecoration(
                          border: boxSelected(selection, index),
                        ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        SSocket().setX(rights![index]);
                        print("table: " + rights![index]);
                        select(index, rights![index]);
                      },
                      color: Colors.black,
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(
                          side: circleSelected(circleSelection, rights![index])
                      ),
                    ),
                  ]
              )
          )
      ));
    }

    widgets[xs!.length] = Align(
      alignment: Alignment(0, 1),
      child: Container(
        width: 10000,
        height: 140,
        color: kPrimaryColor,
      ),
    );
    widgets[xs!.length + 2] = Align(
      alignment: Alignment(0, 0.79),
      child: Text(
        "Kitchen",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24
        ),
      )
    );
    widgets[this.xs!.length + 1] = Align(
      alignment: Alignment(0, 0.95),
      child: Container(
          width: 95,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.lightBlue.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.lightBlue.withOpacity(0.12);
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            child: Text(style: TextStyle(color: kPrimaryColor),"Return"),
            onPressed: () {
              SSocket().setX("88");
            },
          )
      ),
    );

    return Stack(
      children: widgets
    );
  }

  void select(int index, String circle) {
    setState(() {
      circleSelection = circle;
      selection = index;
      ResetNames();
    });
  }
}