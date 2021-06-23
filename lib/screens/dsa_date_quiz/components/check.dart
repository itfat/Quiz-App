import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../globals.dart';
import '../../../screens/result/result_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  List<int> selectedRadio = [0,0];

  @override
  void initState() {
    super.initState();
  }

  setSelectedRadio(int val, int index) {
    setState(() {
      selectedRadio[index] = val;
    });
  }
  scoreComputing( AsyncSnapshot<DocumentSnapshot> snapshot){
      int counter = 0;
      total = snapshot.data!.data().length;
    for(int i=1; i<=snapshot.data!.data().length; i++){
      // print()
      if(snapshot.data!.data()["questions"]["question $i"]["answer"]==selectedRadio[i-1])
      {
        counter++;
      }
    }
    return counter;

  }

  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot> getQuizInfo() async {
      return await FirebaseFirestore.instance
          .collection("quizzes")
          .doc('IQfcs1xF6j0ZrRTVDG3b')
          .get();
    }

    return Container(
        child: FutureBuilder(
            future: getQuizInfo(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: <Widget>[
                    for (int i = 1; i <= snapshot.data!.data().length; i++)
                      Column(
                        children: [
                          SizedBox(height: getProportionateScreenHeight(20)),
                          Text("Q#$i: " +
                              snapshot.data!.data()["questions"]["question $i"]
                                  ["description"]),
                          new RadioListTile<int>(
                            value: 1,
                            groupValue: selectedRadio[i-1],
                            onChanged: (val) {
                              print("Value");
                              print(val.runtimeType);

                              setSelectedRadio(val!, i-1);
                            },
                            title: new Text(snapshot.data!.data()["questions"]
                                ["question $i"]["option 1"]),
                          ),
                          new RadioListTile<int>(
                            groupValue: selectedRadio[i-1],
                            onChanged: (val) {
                              setSelectedRadio(val!, i-1);
                            },
                            title: new Text(snapshot.data!.data()["questions"]
                                ["question $i"]["option 2"]),
                            value: 2,
                          ),
                          new RadioListTile<int>(
                            groupValue: selectedRadio[i-1],
                            onChanged: (value) {
                              setSelectedRadio(value!, i-1);
                            },
                            title: new Text(snapshot.data!.data()["questions"]
                                ["question $i"]["option 3"]),
                            value: 3,
                          ),
                          new RadioListTile<int>(
                            groupValue: selectedRadio[i-1],
                            onChanged: (value) {
                              setSelectedRadio(value!, i-1);
                            },
                            title: new Text(snapshot.data!.data()["questions"]
                                ["question $i"]["option 4"]),
                            value: 4,
                          ),
                        
                          
                        ],
                      
                      ),
                    
                    ElevatedButton(
                      onPressed: () {
                        score = scoreComputing(snapshot);
                        Navigator.pushReplacementNamed(
                            context, ResultScreen.routeName,  );
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor, //button's fill color
                        shadowColor:
                            Colors.black, //specify the button's elevation color
                        elevation: 4.0, //buttons Material shadow
                        minimumSize: Size(300,
                            40), //specify the button's first: width and second: height
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                35.0)), // set the buttons shape. Make its birders rounded etc
                        enabledMouseCursor: MouseCursor
                            .defer, //used to construct ButtonStyle.mouseCursor
                        disabledMouseCursor: MouseCursor
                            .uncontrolled, //used to construct ButtonStyle.mouseCursor
                        visualDensity: VisualDensity(
                            horizontal: 0.0,
                            vertical: 0.0), //set the button's visual density
                        tapTargetSize: MaterialTapTargetSize
                            .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                        animationDuration: Duration(
                            milliseconds:
                                100), //the buttons animations duration
                        enableFeedback:
                            true, //to set the feedback to true or false
                        alignment:
                            Alignment.center, //set the button's child Alignment
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }

        }));
  }
}
