import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> getUserInfo() async {
      return await FirebaseFirestore.instance
          .collection("quizzes")
          .doc('IQfcs1xF6j0ZrRTVDG3b')
          .get();
    }

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: ListTile(
                  title: FutureBuilder(
                    future: getUserInfo(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(snapshot.data!.data()["questions"]
                            ["question 1"]["answer"]);
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return Text("No data");
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                )),
          ],
        ));
  }
}
