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
  }
}
