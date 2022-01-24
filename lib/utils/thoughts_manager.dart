import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:koa_health/model/thought.dart';

class ThoughtsManager {
  static const String _boxName = "thoughts";
  late Box db;

  Future<void> init() async {
    await Hive.openBox(_boxName);
    db = Hive.box(_boxName);
  }

  List<Thought> getAll() {
    List thoughts = db.values.toList();
    return thoughts.map((e) => Thought.fromJson(jsonDecode(e))).toList();
  }

  Future<void> add(Thought thought) async {
    thought.id = _getKey();
    db.put(thought.id, jsonEncode(thought.toJson()));
  }

  int _getKey() {
    return db.length;
  }
}
