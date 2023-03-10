import 'package:flutter/material.dart';
import 'package:todo_app/card/models/card_core.dart';
import 'package:todo_app/card/models/list_cards.dart';
import 'package:todo_app/card/card.dart';
import 'package:todo_app/services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListCard _listCard = ListCard();

  var checkList = List<int>.filled(1, 0, growable: true);

  void deleteCard(CardCore card) {
    setState(() {
      _listCard.deleteCard(card);
    });
    DatabaseService(id: card.id).deleteCardData();
    checkList[int.parse(card.id)] = int.parse(card.id);
  }

  void addCard(CardCore card) {
    setState(() {
      _listCard.addCard(card);
    });
  }

  void addCardToFirestore() {
    CardCore temp = _listCard.listCards.last;

    // create a new document for the card
    DatabaseService(id: temp.id).updateCardData(
      temp.title,
      temp.completed,
    );
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
        onPressed: () async {
          var idex = checkList.firstWhere((element) => element != -1,
              orElse: () => -1);
          if (idex == -1) {
            checkList.add(checkList.length);
            idex = checkList.last;
          }
          addCard(
            CardCore(
              id: idex.toString(),
              title: 'Type something here',
              completed: false,
            ),
          );
          addCardToFirestore();
          checkList[idex] = -1;
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
