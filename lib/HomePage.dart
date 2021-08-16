import 'package:flutter/material.dart';
import 'Widgets/Entry.dart';
import 'AddEntry.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, int> cash = {'Cash In': 0, 'Cash Out': 0};

  Map<String, Entry> _entries = Entry.entries;

  List<String> _entryIds = [];

  deleteEntry(String id) {
    Entry.entries.remove(id);
    _entryIds.remove(id);
    Entry.count--;
  }

  Widget deleteDialogue(id) {
    return AlertDialog(
        title: Text('delete entry?'),
        content: Text('Delete item?'),
        actions: [
          TextButton(
              onPressed: () async {
                cash[_entries[id].type] -= int.parse(_entries[id].amount);
                print(_entries[id].type);
                await deleteEntry(id);
                Navigator.of(context).pop();
              },
              child: Text('ok')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'))
        ]);
  }

  Widget createTile(String id) {
    if (_entries[id].type == "Cash In")
      return ListTile(
        onTap: () async {
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return deleteDialogue(id);
              });
          this.setState(() {
            _entries = Entry.entries;
          });
        },
        title: Text(
          _entries[id].title,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Theme.of(context).highlightColor),
        ),
        subtitle: Text('Rs ' + _entries[id].amount,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Theme.of(context).highlightColor)),
      );

    return ListTile(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return deleteDialogue(id);
            });
        this.setState(() {
          _entries = Entry.entries;
        });
      },
      title: Text(
        _entries[id].title,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Theme.of(context).errorColor),
      ),
      subtitle: Text('Rs ' + _entries[id].amount,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Theme.of(context).errorColor)),
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
                    'Rs ' + cash['Cash In'].toString(),
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
                      'Cash Out',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.red),
                    ),
                    title: Text(
                      'Rs ' + cash['Cash Out'].toString(),
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
            child: Text(
              'Entries',
              style: Theme.of(context).textTheme.subtitle1,
            )),
        Expanded(
            child: SizedBox(
                height: 240,
                child: ListView.builder(
                    itemCount: Entry.count,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        createTile(_entryIds[index])))),
        TextButton(
            child: Text('Add new entry'),
            onPressed: () async {
              final id = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EntryForm()));

              this.setState(() {
                _entries = Entry.entries;
                _entryIds.add(id);
                cash[_entries[_entryIds[Entry.count - 1]].type] +=
                    int.parse(_entries[_entryIds[Entry.count - 1]].amount);
                print(_entries);
              });
            },
            style: Theme.of(context).textButtonTheme.style),
      ])),
    );
  }
}
