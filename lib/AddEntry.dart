import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
  _EntryForm createState() => _EntryForm();
}

class _EntryForm extends State<EntryForm> {
  List<DropdownMenuItem> dropDown = [];
  String entryType = 'Cash In';

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(),
            TextField(),
            DropdownButton<String>(
              value: entryType,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  entryType = newValue!;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ));
  }
}
