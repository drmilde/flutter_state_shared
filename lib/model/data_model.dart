import 'package:flutter/cupertino.dart';
import 'package:flutter_state_shared/model/kind.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModel {
  static List<Kind> namen = [];

  DataModel() {
    // TODO hier noch mehr initialisieren
    namen = [];
    //laden();
  }

  static void add(Kind kind) {
    namen.add(kind);
    printNamen();
  }

  static void clear() {
    namen.clear();
  }

  static void printNamen() {
    print(namen.length);
    print ("${namen[0].name} : ${namen[0].alter}");
  }

  static void speichern() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt("ank", namen.length);
    for (int i = 0; i < namen.length; i++) {
      String att = "kind_${i}";
      await prefs.setString(att, kindToJson(namen[i]));
    }
  }

  static void laden() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int anzahl = prefs.getInt("ank") ?? 0;
    namen.clear();

    for (int i = 0; i < anzahl; i++) {
      String att = "kind_${i}";
      String value = prefs.getString(att) ?? "unbekannt";
      namen.add(kindFromJson(value));
    }
  }
}
