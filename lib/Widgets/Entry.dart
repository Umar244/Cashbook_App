import 'package:flutter/material.dart';

class Entry extends StatelessWidget {
  final amount;
  final title;

  Entry({@required this.title, @required this.amount});

  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      title: Text(title),
      subtitle: Text('Rs ' + amount),
    ));
  }
}

class EntryList extends StatelessWidget {
  final List<Widget> entryList;

  EntryList({@required this.entryList});

  Widget build(BuildContext context) {
    return ListView(
      children: entryList,
    );
  }
}
