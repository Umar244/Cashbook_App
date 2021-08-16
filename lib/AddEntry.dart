import 'package:flutter/material.dart';
import 'Widgets/Entry.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

var uuid = Uuid();

class EntryForm extends StatefulWidget {
  _EntryForm createState() => _EntryForm();
}

class _EntryForm extends State<EntryForm> {
  List<DropdownMenuItem> dropDown = [];
  String entryType = 'Cash In';
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Entry'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
            alignment: Alignment(0, 0),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(
                        'Title',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: new Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: titleController,
                          onChanged: (val) {},
                        ),
                      )
                    ])),
                Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Column(children: [
                      Text(
                        'Amount',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Container(
                        padding: EdgeInsets.only(),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: new Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          controller: amountController,
                          onChanged: (val) {},
                        ),
                      )
                    ])),
                Container(
                    padding: EdgeInsets.all(6.0),
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: new Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: entryType,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              entryType = newValue;
                            });
                          },
                          items: <String>['Cash In', 'Cash Out']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            );
                          }).toList(),
                        ))),
                Container(
                  padding: EdgeInsets.all(2.0),
                  child: TextButton(
                    style: Theme.of(context).textButtonTheme.style,
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                      Entry entry = Entry(
                          title: titleController.text,
                          amount: amountController.text,
                          type: entryType,
                          id: uuid.v4());
                      Entry.addEntry(entry.id, entry);
                      Navigator.pop(context, entry.id);
                    },
                    child: Text('Submit',
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                )
              ],
            )));
  }
}
