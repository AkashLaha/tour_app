import 'package:flutter/material.dart';
import 'package:tour_app/buttons.dart';
import 'package:tour_app/card_class.dart';
import 'package:tour_app/list_card.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListCard lc = ListCard();
  List<bool> cardVisibility = List.generate(3, (index) => true);
  bool allCardsDeleted = false;

  void hideCard(int index) {
    setState(() {
      cardVisibility[index] = false;
    });

    if (cardVisibility.every((isVisible) => !isVisible)) {
      setState(() {
        allCardsDeleted = true;
      });
    }
  }

  void deleteCard(int index) {
    setState(() {
      lc.listcard.removeAt(index);
    });
  }

  void refreshCards() {
    setState(() {
      cardVisibility = List.generate(lc.listcard.length, (index) => true);
      allCardsDeleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour App'),
      ),
      body: ListView.builder(
        itemCount: lc.listcard.length + (allCardsDeleted ? 1 : 0),
        itemBuilder: (context, index) {
          if (allCardsDeleted && index == lc.listcard.length) {
            return ElevatedButton(
              onPressed: refreshCards,
              child: Text('Refresh'),
            );
          }
          if (cardVisibility[index]) {
            return Card(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(lc.listcard[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    lc.listcard[index].loc,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    lc.listcard[index].price,
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      hideCard(index);
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
