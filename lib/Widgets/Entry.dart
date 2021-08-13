import 'package:flutter/material.dart';

class Entry {
  final amount;
  final title;
  final type;

  Entry({@required this.title, @required this.amount, @required this.type});

  createRow() {
    if (type == 'Cash In') {
      return TableRow(children: [Text(title), Text(amount), Text('')]);
    } else {
      return TableRow(children: [Text(title), Text(''), Text(amount)]);
    }
  }
}
