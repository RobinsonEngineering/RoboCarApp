import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:characterization/components/socket.dart';
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

  int value = 2;

  int selection = 0;

  @override
  Widget build(BuildContext context) {
    Border boxSelected(int s, int i) => (s == i ? Border.all(
        color: Colors.orangeAccent,
        width: 3
    ) : Border.all(width: 0, color: kBackgroundColor));
    BorderSide circleSelected(int s, int i) => (s == i ? BorderSide(
        color: Colors.orangeAccent,
        width: 3
    ) : BorderSide(width: 0, color: kBackgroundColor));

    List<Widget> widgets = List.filled(xs!.length, Center());
    print(selection);
    for (int index = 0; index < this.xs!.length; ++index) {
      widgets[index] = (Align(
          alignment: Alignment(xs![index], ys![index]),
          child: Container(
              height: 100,
              width: 250,
              // transform: new Matrix4.identity()..rotateZ(thetas![index] * pi / 180),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        SSocket().setX(lefts![index]);
                        select(index);
                      },
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(
                        side: circleSelected(selection, index)
                      ),
                    ),
                    Container(
                        width: 75,
                        height: 75,
                        // transform: new Matrix4.identity()..rotateZ(theta!),
                        child: Card(
                          color: kPrimaryColor,
                          child: Center(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),

                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kPrimaryColor
                                    )
                                ),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                ),
                              ),
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
                        select(index);
                      },
                      color: Colors.black,
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(
                          side: circleSelected(selection, index)
                      ),
                    ),
                  ]
              )
          )
      ));
    }

    return Stack(
      children: widgets
    );
  }

  void select(int index) {
    setState(() {
      selection = index;
    });
  }
}