import 'package:flutter/material.dart';
import 'package:todo_app/card/models/card_core.dart';
import 'package:todo_app/card/models/list_cards.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/services/database.dart';

class MyCard extends StatefulWidget {
  CardCore card;
  Function deleteCard;
  MyCard(this.card, this.deleteCard);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  ListCard _listCard = ListCard();

  void changeTitleCardToFirestore(CardCore card, String val) {
    DatabaseService(id: card.id).updateCardData(
      val,
      card.completed,
    );
  }

  void changeCheckBoxCardToFirestore(CardCore card, bool val) {
    DatabaseService(id: card.id).updateCardData(
      card.title,
      val,
    );
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _dismissDialog();
                },
                child: TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter new title' : null,
                  onChanged: (val) {
                    setState(() => widget.card.title = val);
                    changeTitleCardToFirestore(widget.card, val);
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Close')),
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  //const Card({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 25,
              top: 25,
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => widget.deleteCard(widget.card),
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: ListTile(
                    leading: Checkbox(
                      onChanged: (value) {
                        setState(() {
                          widget.card.Changed();
                        });
                        changeCheckBoxCardToFirestore(widget.card, value!);
                      },
                      value: widget.card.completed,
                    ),
                    trailing: IconButton(
                      onPressed: _showMaterialDialog,
                      icon: Icon(Icons.edit),
                    ),
                    title: Text(
                      widget.card.title,
                      style: TextStyle(
                        fontSize: 18,
                        decoration: widget.card.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
