import 'package:flutter/material.dart';
import 'package:flutter_state_shared/model/data_model.dart';
import 'package:flutter_state_shared/screens/start_screen.dart';

void main() {
  // bevor die app startet ... Datenmodel initialisieren
  DataModel dm = new DataModel();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management und Shared Preferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(

      ),
    );
  }
}


