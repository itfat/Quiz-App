import 'package:flutter/material.dart';
import '../../custom_bottom.dart';
import 'components/body.dart';
import '../../size_config.dart';
import 'components/check.dart';


class DsaDateScreen extends StatelessWidget {
  static String routeName = "/dsa_date";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("DSA"),
      ),
      body: Check(),
    );
  }
}
