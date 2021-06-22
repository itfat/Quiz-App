import 'package:flutter/material.dart';
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
    );
  }
}