import 'dart:io';

import 'package:riverpod/riverpod.dart';

const String serverName = 'dartserver';
const int port = 8080;
typedef LatestInputCallback = String Function();

Future<void> main() async {
  Server server = Server();
  server.setInput("test");
  Future.delayed(const Duration(milliseconds: 5000), () {
    print("test one");
    server.setInput("bbb");
  });
}

class Server {
  static final Server _singleton = Server._internal();

  Server._internal() {
    setupServer();
  }

  factory Server() {
    return _singleton;
  }

  HttpServer? server;
  String input = "initial";

  void setupServer() async {
    server = await HttpServer.bind(InternetAddress.anyIPv4, 8080, shared: true);

    await for (HttpRequest request in server!) {
      request.response.headers.set('Server', serverName);
      request.response.write(input);

      await request.response.close();
    }
  }

  void setInput(String input) {
    this.input = input;
  }
}
