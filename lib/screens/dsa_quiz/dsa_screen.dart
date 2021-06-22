import 'package:flutter/material.dart';
import '../../custom_bottom.dart';
import 'components/body.dart';
import '../../size_config.dart';


class DsaScreen extends StatelessWidget {
  static String routeName = "/dsa";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("DSA Quiz"),
      ),
      body: Body(),
    );
  }
}
