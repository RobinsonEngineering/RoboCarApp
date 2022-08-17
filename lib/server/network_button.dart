import 'dart:io';
import 'package:characterization/server/server.dart';
import 'package:flutter/material.dart';

class NetworkButton extends StatefulWidget {
  const NetworkButton({Key? key}) : super(key: key);

  @override
  State<NetworkButton> createState() => _NetworkButtonState();
}

class _NetworkButtonState extends State<NetworkButton> {
  Server? myServer;

  _NetworkButtonState() {
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
        OutlinedButton(
          onPressed: () {
            setState(() {
              value = 1;
              // print("bam one");
              myServer!.setInput("go");
            });
          },
          child: Text(
            "Motors on",
            style: TextStyle(
              color: (value == 1) ? Colors.green : Colors.white,
            ),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              value = 2;
              myServer!.setInput("no");
            });
          },
          child: Text(
            "Motors off",
            style: TextStyle(
              color: (value == 2) ? Colors.green : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}