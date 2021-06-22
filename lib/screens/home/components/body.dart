import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mad_assignment_02/constants.dart';
import '../../dsa_quiz/dsa_screen.dart';



class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';
     
    return Container(
      // child:GridView.count(
      //     // Create a grid with 2 columns. If you change the scrollDirection to
      //     // horizontal, this produces 2 rows.
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 4.0,  
      //           mainAxisSpacing: 8.0,  
      //     // Generate 100 widgets that display their index in the List.
      //     children: List.generate(quizData.length, (index) {
      //       return Center(
      //         child: Text(
      //           'Item $index',
      //           style: Theme.of(context).textTheme.headline5,
      //         ),
      //       );
      //     }),
      child: GridView.count(  
                crossAxisCount: 2,  
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

      
      
    
    // color: RandomColorModel().getColor(),
    //   margin: EdgeInsets.all(1.0),
    // );
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
  const Choice(title: 'DSA', icon: AssetImage("assets/images/dsa.png"), color: Colors.amber ),  
  const Choice(title: 'OOP', icon: AssetImage("assets/images/oop.png"), color: Colors.blue),  
  const Choice(title: 'DS', icon: AssetImage("assets/images/3493665.png"), color: Colors.red),  
  const Choice(title: 'AoA', icon: AssetImage("assets/images/algo.png"), color: Colors.pink),  
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
          Navigator.pushNamed(context, DsaScreen.routeName);
        }
        // else if(choice.title=="OOP")
        // {
        //   Navigator.pushNamed(context, OopScreen.routeName);
        // }
        // else if(choice.title=="DS")
        // {
        //   Navigator.pushNamed(context, DsScreen.routeName);
        // }
        // else if(choice.title=="AoA")
        // {
        //   Navigator.pushNamed(context, AoaScreen.routeName);
        // }
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