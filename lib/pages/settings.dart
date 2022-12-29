

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
            height: 300,
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
  String message = "000000";

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

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            style: TextStyle(
          color: Colors.white
          ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                color: Colors.white
                )
              ),
              labelText: 'Delay',
              labelStyle: TextStyle(
    color: Colors.white
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
              (() {if (message.substring(0, 0)  == '1') { return "Front plate: active: "; } return "Front plate: inactive";}()),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              )
          ),
        ),

        Padding(
        padding: EdgeInsets.all(10),
    child:Text(
            (() {if (message.substring(1, 1)  == '1') { return "Back plate: active: "; } return "Back plate: inactive";}()),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )
        ),
        ),
    Padding(
    padding: EdgeInsets.all(10),
    child:Text(
            (() {if (message.substring(2, 2)  == '1') { return "Front sensor: active: "; } return "Front sensor: inactive";}()),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )
        ),
    ),
    Padding(
    padding: EdgeInsets.all(10),
    child:Text(
            (() {if (message.substring(3, 3)  == '1') { return "Back sensor: active: "; } return "Back sensor: inactive";}()),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )
        ),
    ),
      ],
    );
  }

  void update(int test) {
    setState(() {
      message = Socket().getServer();
      if (message.length == 0) {
        message = "00000";
      }
    });
  }
}