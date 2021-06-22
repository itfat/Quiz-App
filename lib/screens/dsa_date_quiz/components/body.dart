import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> getQuizInfo() async {
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
                    future: getQuizInfo(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        for(int i=1;i<=snapshot.data!.data().length;i++)
                        {
                          print(snapshot.data!.data().length);
return  Column(
  children: [
        Text("Q # $i"+snapshot.data!.data()["questions"]
                                  ["question $i"]["description"]+'\n'+"a) "+snapshot.data!.data()["questions"]
                                  ["question $i"]["option 1"]+'\n'+"b) "+snapshot.data!.data()["questions"]
                                  ["question $i"]["option 2"]+'\n'+"c) "+snapshot.data!.data()["questions"]
                                  ["question $i"]["option 3"]+'\n'+"d) "+snapshot.data!.data()["questions"]
                                  ["question $i"]["option 4"],
    ),
  ],
);
                      } 
                        }
                        
                          // return Text("Q # 01"+snapshot.data!.data()["questions"]
                          //   ["question 1"]["description"]+'\n'+"a) "+snapshot.data!.data()["questions"]
                          //   ["question 1"]["option 1"]+'\n'+"b) "+snapshot.data!.data()["questions"]
                          //   ["question 1"]["option 2"]+'\n'+"c) "+snapshot.data!.data()["questions"]
                          //   ["question 1"]["option 3"]+'\n'+"d) "+snapshot.data!.data()["questions"]
                          //   ["question 1"]["option 4"]);
                      // } else if (snapshot.connectionState ==
                      //     ConnectionState.none) {
                      //   return Text("No data");
                      // }
                      return CircularProgressIndicator();
                    },
                  ),
                )),
          ],
        ));
  }
}
