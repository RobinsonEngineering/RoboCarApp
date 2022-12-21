

import 'dart:async';

import 'package:characterization/constants.dart';
import 'package:flutter/material.dart';

import '../components/is_running.dart';
import '../components/socket.dart';
import '../components/table.dart';
import 'home.dart';

class Settings extends StatelessWidget {
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
        body: Center(
          child: Container(
            height: 76,
            width: 200,
            child: Card(
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: StatusCard()
              )
            )
          )
        )
    );
  }
}

class StatusCard extends StatefulWidget {
  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  String message = "test";

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {update(1);});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {

    return Text(
          message,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24
        ));
  }

  void update(int test) {
    setState(() {
      message = Socket().getServer();
    });
  }
}