import 'package:flutter/material.dart';

class CardCore {
  String title;
  bool completed;

  CardCore({
    required this.title,
    required this.completed,
  });

  void Changed() {
    completed = !completed;
  }
}
