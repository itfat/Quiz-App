import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import 'screens/login/login_screen.dart';


class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
