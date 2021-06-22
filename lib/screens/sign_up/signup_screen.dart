import 'package:flutter/material.dart';
import '../../custom_bottom.dart';
import 'components/body.dart';
import '../../size_config.dart';


class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
      bottomSheet: SizedBox(height:getProportionateScreenHeight(90),
     
      child: CustomBottom()),
    );
  }
}
