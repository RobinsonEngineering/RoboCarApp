import 'dart:io';
import 'dart:typed_data';

void main() async {
  // bind the socket server to an address and port
  // listen for client connections to the server
  print("alive");
  while (true) {
    await Future.delayed(Duration(seconds: 1));
      print(SSocket().getServer());
  }

  // while (true) {
  //   try {
  //     Socket.connect("localhost", 8080).then((socket) {
  //       print('client connected : ${socket.remoteAddress.address}:${socket.remotePort}');
  //
  //       socket.listen((data) {
  //         print("client listen  : ${String.fromCharCodes(data).trim()}");
  //       }, onDone: () {
  //         print("client done");
  //         socket.destroy();
  //       });
  //
  //       socket.write("bob");
  //     });
  //   } catch (e) {
  //
  //   }
  // }

  print("dead");
}

class SSocket {
  static final SSocket _singleton = SSocket._internal();
  static String message = "";
  static String send = "";

  SSocket._internal() {
    setupServer();
  }

  factory SSocket() {
    return _singleton;
  }

  ServerSocket? socket;
  String input = "initial";

  void setupServer() async {
    socket = await ServerSocket.bind(InternetAddress.anyIPv4, 8080);
  //
  //   await for (HttpRequest request in server!) {
  //     request.response.headers.set('Server', serverName);
  //     request.response.write(input);
  //
  //     await request.response.close();
  //   }
    socket!.listen((Socket socket) {
      socket.writeln("testing");

      socket.listen((var data) async {
        message = String.fromCharCodes(data);
        socket.write("test");
        socket.add({0}.toList());
        socket.close();
        print(message);
      },


        // handle errors
        onError: (error) {
          print(error);
          socket.close();
        },

        // handle the client closing the connection
        onDone: () {
          print('Client left');
          socket.close();
        },
      );
    });
  }

  String getServer() {
    return message;
  }

  void setInput(String input) {
    // socket!.
    this.input = input;
  }
}
