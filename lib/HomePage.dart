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

  List<Entry> _entries = Entry.entries;

  Widget createTile(Entry entry) {
    return ListTile(
      leading: GestureDetector(
        child: Row(
          children: [Text(entry.title)],
        ),
      ),
    );
  }

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
        Flexible(
            child: ListView.builder(
                itemCount: Entry.count,
                shrinkWrap: true,
                itemBuilder: (context, index) => createTile(_entries[index]))),
        TextButton(
            child: Text('Add new entry'),
            onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntryForm()));

              this.setState(() {
                _entries = Entry.entries;
                print(_entries);
              });
            },
            style: Theme.of(context).textButtonTheme.style),
      ])),
    );
  }
}
