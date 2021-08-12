import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
  _EntryForm createState() => _EntryForm();
}

class _EntryForm extends State<EntryForm> {
  List<DropdownMenuItem> dropDown = [];
  String entryType = 'Cash In';
  TextEditingController titleController = TextEditingController(text: 'Title');
  TextEditingController amountController = TextEditingController(text: '0');

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Entry',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: Container(
            padding: EdgeInsets.only(top: 8.0, left: 2.0),
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
                        padding: EdgeInsets.only(),
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
                      Navigator.pop(context, {
                        'title': titleController.text,
                        'Amount': amountController.text
                      });
                    },
                    child: Text('Submit',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.white)),
                  ),
                )
              ],
            )));
  }
}
