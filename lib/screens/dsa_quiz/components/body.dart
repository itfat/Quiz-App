import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../screens/dsa_date_quiz/dsa_date_01.dart';
import '../../dsa_quiz/dsa_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(choices.length, (index) {
              return Center(
                child: SelectCard(choice: choices[index]),
              );
            })));
  }
}

class Choice {
  const Choice({required this.color});

  final Color color;
}

List<Choice> choices = <Choice>[
  Choice(color: Colors.amber),
];

Future<DocumentSnapshot> getQuizInfo() async {
  return await FirebaseFirestore.instance
      .collection("quizzes")
      .doc('IQfcs1xF6j0ZrRTVDG3b')
      .get();
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DsaDateScreen.routeName);
        },
        child: Card(
          color: choice.color,
          child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                FutureBuilder(
                    future:
                        getQuizInfo(), //This is the method that returns your Future
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print(snapshot.data);
                        return Text(
                          snapshot.data.data()["title"],
                          style: TextStyle(color: Colors.black),
                        ); //Do stuff and build your screen from this method
                      } else {
                        return Text(" ");
                      }
                    })
              ])),
        ));
  }
}
