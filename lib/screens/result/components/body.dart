import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../globals.dart';
import '../../../size_config.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  int totalScore = total * 10;
  int obtainedScore = score * 10;
    return Container(
        child: Column(children: [
      SvgPicture.asset("assets/images/undraw_winners_ao2o.svg",
      
    width: 300,
    height: 200,),
      SizedBox(height: getProportionateScreenHeight(20)),
      Text("Your score is: $obtainedScore/$totalScore", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    ]));
  }
}
