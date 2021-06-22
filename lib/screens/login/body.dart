import 'package:flutter/material.dart';
import '../../../size_config.dart';
import '../../constants.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(100)),
          Text(
            "Login Now",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Please login to continue using the app"),
          SizedBox(height: getProportionateScreenHeight(50)),
          LoginForm(),
        ],
      ),
    );

    // SafeArea(
    //   child: SizedBox(
    //     width: double.infinity,
    //     child: Padding(
    //       padding:
    //           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             SizedBox(height: SizeConfig.screenHeight * 0.04),

    //             SizedBox(height: SizeConfig.screenHeight * 0.08),
    //             // SignForm(),
    //             SizedBox(height: SizeConfig.screenHeight * 0.08),

    //             SizedBox(height: getProportionateScreenHeight(20)),
    //             // NoAccountText(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
