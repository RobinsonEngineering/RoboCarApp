import 'dart:io';
import 'package:characterization/server/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeedWidget extends StatefulWidget {
  const SpeedWidget({Key? key}) : super(key: key);

  @override
  State<SpeedWidget> createState() => _SpeedWidgetState();
}

class _SpeedWidgetState extends State<SpeedWidget> {
  Server? myServer;

  _SpeedWidgetState() {
    print("constructor");
    getMyServer();
  }

  void getMyServer() async {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
    myServer = await Server.returnFuture(server);
    myServer!.setupServer(server);
    print("initialized server");
  }

  int value = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(
              color: Colors.white
          ),
          decoration: new InputDecoration(
            labelText: "pick a number, any number",
            labelStyle: TextStyle(
              color: Colors.white
            ),
          )
        ),
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          style: TextStyle(
            color: Colors.white
          ),
          decoration: new InputDecoration(
            labelText: "pick a number, any number",
            labelStyle: TextStyle(
              color: Colors.white
            ),
          )
        ),
      ],
    );
  }
}