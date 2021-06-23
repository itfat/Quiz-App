import 'package:flutter/material.dart';
import '../../custom_bottom.dart';
import '../../size_config.dart';
import 'components/body.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({ Key? key }) : super(key: key);
static String routeName = "/result";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Body(),  
       bottomSheet: SizedBox(height:getProportionateScreenHeight(90),
     
      child: CustomBottom()),
    );
  }
}