import 'package:flutter/material.dart';

class Entry {
  final String amount;
  final String title;
  final String type;
  final int id;
  static int count = 0;
  static List<Entry> entries = [];

  static addEntry(entry) {
    entries.add(entry);
    count++;
  }

  Entry(
      {@required this.title,
      @required this.amount,
      @required this.type,
      @required this.id});
}
