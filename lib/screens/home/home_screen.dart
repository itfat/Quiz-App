import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Quiz App"),
      ),
      body: Body(),
      drawer: Container(child: HomeDrawer() ,color: Colors.white,),
      
    );
  }
}