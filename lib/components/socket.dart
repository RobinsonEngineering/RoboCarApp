import 'dart:io';
import 'dart:typed_data';

void main() async {
  // bind the socket server to an address and port
  // listen for clent connections to the server
  print("alive");
  while (true) {
    await Future.delayed(Duration(seconds: 1));
      print(Socket().getServer());
  }
}

class Socket {
  static final Socket _singleton = Socket._internal();
  static String message = "";

  Socket._internal() {
    setupServer();
  }

  factory Socket() {
    return _singleton;
  }

  ServerSocket? server;
  String input = "initial";

  void setupServer() async {
    server = await ServerSocket.bind(InternetAddress.anyIPv4, 8080);
  //
  //   await for (HttpRequest request in server!) {
  //     request.response.headers.set('Server', serverName);
  //     request.response.write(input);
  //
  //     await request.response.close();
  //   }
    server!.listen((client) {
      client.listen((var data) async {
        message = String.fromCharCodes(data);
        print(message);
      },

        // handle errors
        onError: (error) {
          print(error);
          client.close();
        },

        // handle the client closing the connection
        onDone: () {
          print('Client left');
          client.close();
        },
      );
    });
  }

  String getServer() {
    return message;
  }

  void setInput(String input) {
    this.input = input;
  }
}
