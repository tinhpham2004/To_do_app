import 'package:flutter/material.dart';
import 'card_core.dart';

class ListCard {
  List<CardCore> listCards = [];

  void addCard(CardCore card) {
    listCards.add(card);
  }

  void deleteCard(CardCore card) {
    listCards.remove(card);
  }
}
