// import 'dart:io';
// import 'dart:typed_data';
//
// class SSocket {
//   static final SSocket _singleton = SSocket._internal();
//   static String message = "";
//   static String send = "";
//
//   SSocket._internal() {
//     setupServer();
//   }
//
//   factory SSocket() {
//     return _singleton;
//   }
//
//   String input = "initial";
//
//   void setupServer() async {
//     // connect to the socket server
//     final socket = await Socket.connect('172.20.10.3', 8080);
//     print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');
//
//       socket.listen(
//
//     // handle data from the server
//         (Uint8List data) {
//       final serverResponse = String.fromCharCodes(data);
//       print('Server: $data');
//       socket.write("poke");
//     },
//
//     // handle errors
//     onError: (error) {
//       print(error);
//       socket.destroy();
//     },
//
//     // handle server ending connection
//     onDone: () {
//       print('Server left.');
//       socket.destroy();
//     },
//   );
//
//     // await sendMessage(socket, 'Knock, knock.');
//     // await sendMessage(socket, 'Banana');
// }
//
//   // Future<void> sendMessage(String message) async {
//   //   if (socket != null) {
//   //     print('Client: $message');
//   //     socket!.write(message);
//   //     await Future.delayed(Duration(seconds: 2));
//   //   }
//   // }
//
//   // Socket getSocket() {
//   //   return socket!;
//   // }
//
//   String getServer() {
//     return message;
//   }
//
//   void setInput(String input) {
//     // socket!.
//     // this.input = input;
//     // if (socket != null) {
//     //   socket!.write(input);
//     // }
//   }
// }
//
// void main() async {
//   SSocket();
//   await Future.delayed(Duration(seconds: 5));
//   sendMessage();
//   // await Future.delayed(Duration(seconds: 5));
//   // sendMessage();
//   // SSocket().sendMessage("tf");
//   // await Future.delayed(Duration(seconds: 5));
//   // sendMessage();
//   // SSocket().sendMessage("fdsafds");
//   // await Future.delayed(Duration(seconds: 5));
//   // sendMessage();
//   // SSocket().sendMessage("wwww");
// }
//
// Future<void> sendMessage() async {
//   print("wtf");
//   // SSocket().setInput("freetos");
//   await Future.delayed(Duration(seconds: 2));
// }

import 'dart:io';
import 'dart:typed_data';

class SSocket {
  static final SSocket _singleton = SSocket._internal();

  String x = "00";
  String delay = "010";
  String recievedMessage = "x";

  SSocket._internal() {
    setup();
  }

  factory SSocket() {
    return _singleton;
  }

  void setup() async {
    // connect to the socket server
    final socket = await Socket.connect('192.168.1.65', 8080);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    // listen for responses from the server
    socket.listen(

      // handle data from the server
          (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        recievedMessage = serverResponse;
        print('Server: $serverResponse');
        socket.write(x + delay);
      },

      // handle errors
      onError: (error) async {
        print(error);
        await Future.delayed(Duration(milliseconds: 10000));
        setup();
      },

      // handle server ending connection
      onDone: () async {
        print('Server left.');
        await Future.delayed(Duration(milliseconds: 10000));
        setup();
      },
    );

    // while (true) {
    //   socket.write(x);
    // }
  }

  void setX(String newX) {
    x = newX;
  }

  void setDelay(String newDelay) {
    delay = newDelay;
  }

  String getArduinoCode() {
    return recievedMessage;
  }
}

void main() async {
  for (double i = 0; i < 100000; ++i) {
    SSocket().setX(i.toString());
    await Future.delayed(Duration(milliseconds: 1000));
  }
}

Future<void> sendMessage(Socket socket, String message) async {
  socket.write(message);
  await Future.delayed(Duration(seconds: 2));
}