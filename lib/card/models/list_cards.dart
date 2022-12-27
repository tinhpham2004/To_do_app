import 'package:flutter/material.dart';
import 'card_core.dart';

class ListCard {
  List<CardCore> listCards = [
    CardCore(
      title: 'Eat',
      completed: false,
    ),
    CardCore(
      title: 'Sleep',
      completed: false,
    ),
    CardCore(title: 'Miss her', completed: true),
  ];

  void addCard(CardCore card) {
    listCards.add(card);
  }

  void deleteCard(CardCore card) {
    listCards.remove(card);
  }
}
