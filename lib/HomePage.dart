import 'package:flutter/material.dart';
import 'Widgets/Entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cashIn = 500;
  final cashOut = 200;

  EntryList _entries = EntryList(entryList: []);
  List<Entry> entryList = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hisab Kitab')),
      body: Center(
          child: Container(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Column(children: [
                Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Container(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                              color: Colors.greenAccent,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                        width: 150,
                                        height: 80,
                                        child: ListTile(
                                          subtitle: Text('CASH IN'),
                                          title:
                                              Text('Rs ' + cashIn.toString()),
                                        )),
                                  ]))),
                      Container(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                              color: Colors.redAccent,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 150,
                                      height: 80,
                                      child: ListTile(
                                        subtitle: Text('CASH OUT'),
                                        title: Text('Rs $cashOut'),
                                      ),
                                    ),
                                  ])))
                    ])),
                Container(
                    padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Row(children: [
                      Text('Entries'),
                    ])),
                Expanded(child: SizedBox(height: 250, child: _entries)),
                TextButton(
                  child: Text('Add new entry'),
                  onPressed: () async {
                    this.setState(() {
                      List<Entry> temp = entryList;
                      for (int i = 0; i < 12; i++) {
                        temp.add(Entry(title: 'Entry no $i', amount: 20 * i));
                      }
                      _entries = EntryList(entryList: temp);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ]))),
    );
  }
}
