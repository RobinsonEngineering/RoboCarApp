import 'package:shared_preferences/shared_preferences.dart';

class TableManager {
  static final TableManager _singleton = TableManager._internal();

  List<String> names = List.filled(8, "");
  SharedPreferences? prefs;

  TableManager._internal() {
    setup();
  }

  factory TableManager() {
    return _singleton;
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();
  }

  String getName(int index) {
    if (prefs != null) {
      return prefs!.getString(index.toString()) ?? "";
    } else {
      return "";
    }
  }

  void setName(int index, String str) {
    if (prefs != null) {
      prefs!.setString(index.toString(), str);
    }
  }
}