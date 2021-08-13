import 'package:flutter/material.dart';
import 'Widgets/Entry.dart';
import 'AddEntry.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cashIn = 0;
  int cashOut = 0;

  List<TableRow> _entries = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hisab Kitab'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
          child: Column(children: [
        Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            color: Theme.of(context).accentColor,
            child: SizedBox(
                width: 160,
                height: 80,
                child: ListTile(
                  subtitle: Text('Cash In',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.green)),
                  title: Text(
                    'Rs ' + cashIn.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.green),
                  ),
                )),
          ),
          Card(
              color: Theme.of(context).accentColor,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                SizedBox(
                  width: 160,
                  height: 80,
                  child: ListTile(
                    subtitle: Text(
                      'CASH OUT',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.red),
                    ),
                    title: Text(
                      'Rs $cashOut',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ]))
        ])),
        Container(
            alignment: const Alignment(-1, 0),
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Table(children: [
              TableRow(children: [
                const Text('Title'),
                const Text('Cash In'),
                const Text('Cash Out')
              ])
            ])),
        Expanded(
            child: SizedBox(
                height: 240,
                child: SingleChildScrollView(
                    child: Table(
                  border:
                      TableBorder.all(color: Theme.of(context).primaryColor),
                  children: _entries,
                )))),
        TextButton(
            child: Text('Add new entry'),
            onPressed: () async {
              final result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntryForm()));
              if (result != null) {
                this.setState(() {
                  //Simulate data loop

                  /*for (int i = 0; i < 20; i++) {
                    temp.add(Entry(
                            amount: (i * 2000).toString(),
                            title: '$i Entry',
                            type: 'Cash In')
                        .createRow());
                  }*/
                  List<TableRow> temp = _entries;

                  if (result['type'] == 'Cash In') {
                    cashIn += int.parse(result['Amount']);
                  } else {
                    cashOut += int.parse(result['Amount']);
                  }
                  temp.add(Entry(
                          title: result['title'],
                          amount: result['Amount'],
                          type: result['type'])
                      .createRow());

                  _entries = temp;
                });
              }
            },
            style: Theme.of(context).textButtonTheme.style),
      ])),
    );
  }
}
