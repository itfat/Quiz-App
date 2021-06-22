import 'package:flutter/material.dart';
import '../../custom_bottom.dart';
import 'body.dart';
import '../../size_config.dart';


class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
      bottomSheet: SizedBox(height:getProportionateScreenHeight(90),
     
      child: CustomBottom()),
    );
  }
}
