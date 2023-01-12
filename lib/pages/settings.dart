

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
        body: Center(
          child: Container(
            height: 375,
            width: 225,
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
  String message = "000000000000";

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
            onChanged: (String s) {
              SSocket().setDelay(s);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
              (() {if (message.substring(5, 6) == '1') { return "Front plate: active"; } else {return "Front plate: inactive";}}()),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              )
          ),
        ),

        Padding(
        padding: EdgeInsets.all(10),
    child:Text(
            (() {if (message.substring(6, 7) == '1') { return "Back plate: active"; } else {return "Back plate: inactive";}}()),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )
        ),
        ),
    Padding(
    padding: EdgeInsets.all(10),
    child:Text(
            (() {if (message.substring(3, 4)  == '1') { return "Front sensor: active"; } return "Front sensor: inactive";}()),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )
        ),
    ),
    Padding(
    padding: EdgeInsets.all(10),
    child:Text(
            (() {if (message.substring(4, 5)  == '1') { return "Back sensor: active"; } return "Back sensor: inactive";}()),
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            )
        ),
    ),
        Padding(
          padding: EdgeInsets.all(10),
          child:Text(
              (() {if (message.substring(2, 3)  == '1') { return "Magnet sensor: active"; } return "Magnet sensor: inactive";}()),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
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
                    child: Text(style: TextStyle(color: kPrimaryColor),"Exercise On"),
                    onPressed: () {
                      SSocket().setX("00");
                    },
                  )
              ),
              Container(
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
                    child: Text(style: TextStyle(color: kPrimaryColor),"Exercise Off"),
                    onPressed: () {
                      SSocket().setX("99");
                    },
                  )
              )
            ],
          )



        )
      ],
    );
  }

  void update(int test) {
    setState(() {
      String code = SSocket().getArduinoCode();
      if (code.length > 6) {
        print("arduino code: " + message);
        message = code;
      }

    });
  }
}