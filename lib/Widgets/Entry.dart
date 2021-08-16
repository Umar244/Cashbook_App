import 'package:flutter/material.dart';

class Entry {
  final String amount;
  final String title;
  final String type;
  String id;
  static int count = 0;
  static Map<String, Entry> entries = {};

  static addEntry(String index, entry) {
    entries[index] = entry;
    count++;
  }

  Entry(
      {@required this.title,
      @required this.amount,
      @required this.type,
      @required this.id});
}
