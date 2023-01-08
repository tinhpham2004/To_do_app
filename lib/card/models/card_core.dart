import 'package:flutter/material.dart';

class CardCore {
  String id;
  String title;
  bool completed;

  CardCore({
    required this.id,
    required this.title,
    required this.completed,
  });

  void Changed() {
    completed = !completed;
  }
}
