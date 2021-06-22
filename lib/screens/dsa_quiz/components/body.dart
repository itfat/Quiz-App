import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mad_assignment_02/constants.dart';
import 'package:mad_assignment_02/screens/dsa_date_quiz/dsa_date_01.dart';
import '../../dsa_quiz/dsa_screen.dart';



class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';
     
    return Container(
      child: GridView.count(  
                crossAxisCount:3,  
                crossAxisSpacing: 4.0,  
                mainAxisSpacing: 8.0,  
                children: List.generate(choices.length, (index) {  
                  return Center(  
                    child: SelectCard(choice: choices[index]),  
                  );  
                }  
                )  
            )  
        );  
  }
}

class Choice {  
  const Choice({required this.title, required this.icon, required this.color});  
  final String title;  
  // final Image icon;
  final icon;
  final Color color;  
}  
  
const List<Choice> choices = const <Choice>[  
  const Choice(title: '', icon: AssetImage("assets/images/dsa.png"), color: Colors.amber ),   
];  
  
class SelectCard extends StatelessWidget {
  
  
  const SelectCard({Key? key, required this.choice}) : super(key: key);  
  final Choice choice;  
  
  @override  
  Widget build(BuildContext context) {  
    final TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return GestureDetector(
      onTap: () {
        if(choice.title=="DSA")
        {
          Navigator.pushNamed(context, DsaDateScreen.routeName);
        }
      } ,
          child: Card(  
          color: choice.color,  
          child: Center(child: Column(  
              crossAxisAlignment: CrossAxisAlignment.center,  
              children: <Widget>[  
                Expanded(child: Image(image: choice.icon)),  
                Text(choice.title, style: textStyle),  
              ]  
          ),  
          )  
      ),
    );  
  }  
}  