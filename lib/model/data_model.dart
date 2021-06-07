import 'package:flutter_state_shared/model/kind.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModel {
  static List<Kind> namen = [];

  DataModel() {
    // TODO hier noch mehr initialisieren
    namen = [];
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
    print("${namen[0].name} : ${namen[0].alter}");
  }

  // löscht den Speicher
  static void clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // speichert die Daten
  static void speichern() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt("ank", namen.length);
    for (int i = 0; i < namen.length; i++) {
      String att = "kind_${i}";
      await prefs.setString(att, kindToJson(namen[i]));
    }
  }

  // lädt die Daten aus den shared preferences
  static Future<bool> laden() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? anzahl = prefs.getInt("ank") ?? 0;
    namen.clear();

    for (int i = 0; i < anzahl; i++) {
      String att = "kind_${i}";
      String value = prefs.getString(att) ?? '{"name":"unbekannt", "alter": 0}';
      namen.add(kindFromJson(value));
    }

    return true;
  }
}
