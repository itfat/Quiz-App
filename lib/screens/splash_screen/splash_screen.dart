import 'package:flutter/material.dart';
import 'package:mad_assignment_02/screens/splash_screen/components/splash_content.dart';
import '../../custom_bottom.dart';
import '../../size_config.dart';
import 'components/splash_content.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig.init(context);
    return Scaffold(
      body: SplashContent(),
      bottomSheet: SizedBox(height:getProportionateScreenHeight(90),
     
      child: CustomBottom()),
    );
  }
}
