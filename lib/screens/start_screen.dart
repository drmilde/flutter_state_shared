import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_state_shared/model/data_model.dart';
import 'package:flutter_state_shared/model/kind.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<Kind> kinder = [
    Kind(name: "Elisabeth", alter: 24),
    Kind(name: "Rebecca", alter: 21),
    Kind(name: "Antonia", alter: 13),
    Kind(name: "Jakob", alter: 9),
  ];

  Random rand = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    DataModel.laden().then((value) {
      setState(() {
        // wenn daten geladen wurden, dann UI aktualisieren
        // initstate wird erst aufgerufen, wenn das UI gemaounted wurde
        // wir können also sicher sein, dass ein context existiert
        // und setState aufgerufen werden kann
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datenmanangement"),
      ),
      body: Column(
        children: [
          Container(
              child: ElevatedButton(
            onPressed: () {
              setState(() {
                Kind k = kinder[rand.nextInt(4)];
                DataModel.add(k);
              });
            },
            child: Text("Noch ein Name"),
          )),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              setState(() {
                DataModel.laden();
              });
            },
            child: Text("Daten laden"),
          )),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              DataModel.speichern();
            },
            child: Text("Daten speichern"),
          )),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              setState(() {
                DataModel.clear();
              });
            },
            child: Text("Liste löschen (in Datenmodell)"),
          )),
          SizedBox(
            height: 16,
          ),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              setState(() {
                DataModel.clearPrefs();
                DataModel.laden();
              });
            },
            child: Text("Prefs löschen"),
          )),
          Expanded(
            child: ListView.builder(
                itemCount: DataModel.namen.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              DataModel.namen[index].name,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            "${DataModel.namen[index].alter}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Container(
            height: 32,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
