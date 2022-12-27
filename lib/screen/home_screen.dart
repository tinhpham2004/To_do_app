import 'package:flutter/material.dart';
import 'package:todo_app/card/models/card_core.dart';
import 'package:todo_app/card/models/list_cards.dart';
import 'package:todo_app/card/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CardCore card = CardCore(title: 'Type something here', completed: false);

  ListCard _listCard = ListCard();

  void deleteCard(CardCore card) {
    setState(() {
      _listCard.deleteCard(card);
    });
  }

  void addCard(CardCore card) {
    setState(() {
      _listCard.addCard(card);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('To Do App'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.restart_alt,
              size: 25,
            ),
            tooltip: 'Reset the data',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, id) =>
            MyCard(_listCard.listCards[id], deleteCard),
        itemCount: _listCard.listCards.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCard(card);
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
