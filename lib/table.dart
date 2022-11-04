import 'dart:io';
import 'dart:math';
import 'package:characterization/constants.dart';
import 'package:characterization/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SushiTable extends StatelessWidget {
  SushiTable({Key? key, this.x, this.y, this.theta, this.left, this.right}) : super(key: key);

  double? x;
  double? y;
  double? theta;
  String? left;
  String? right;
  Server myServer = Server();

  int value = 2;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(x!, y!),
      child: Container(
        height: 175,
        transform: new Matrix4.identity()..rotateZ(theta! * pi / 180),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  myServer.setInput(left!);
                },
                // color: kPrimaryColor,
                color: Colors.white,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              Container(
                  width: 100,
                  height: 100,
                  // transform: new Matrix4.identity()..rotateZ(theta!),
                  child: Card(
                    color: kPrimaryColor,
                  )
              ),
              MaterialButton(
                onPressed: () {
                  myServer.setInput(right!);
                },
                // color: kPrimaryColor,
                color: Colors.black,
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
            ]
        )
      )
    );
  }
}