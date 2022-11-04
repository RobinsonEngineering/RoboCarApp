import 'dart:io';
import 'dart:math';
import 'package:characterization/constants.dart';
import 'package:characterization/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IsRunning extends StatefulWidget {
  const IsRunning({super.key});

  @override
  State<IsRunning> createState() => _IsRunningState();
}

class _IsRunningState extends State<IsRunning> {
  int isRunning = 0;

  @override
  Widget build(BuildContext context) {
    if (isRunning == 1) {
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
    }
  }
}