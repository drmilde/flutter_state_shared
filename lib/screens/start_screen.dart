import 'package:flutter/material.dart';
import 'package:flutter_state_shared/model/data_model.dart';
import 'package:flutter_state_shared/model/kind.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
                Kind k = new Kind();
                k.name = "Antonia";
                k.alter = 13;
                DataModel.add(k);
              });
            },
            child: Text("noch ein name"),
          )),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              DataModel.laden();
            },
            child: Text("daten laden"),
          )),
          Container(
              child: ElevatedButton(
            onPressed: () async {
              DataModel.speichern();
            },
            child: Text("daten speichern"),
          )),
          Expanded(
            child: ListView.builder(
                itemCount: DataModel.namen.length,
                itemBuilder: (context, index) {
                  return Text(DataModel.namen[index].name);
                }),
          ),
        ],
      ),
    );
  }
}
