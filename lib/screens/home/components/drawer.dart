import 'package:flutter/material.dart';
import 'package:mad_assignment_02/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              // height: 800,
            ),
            child: Column(
              children: [
                new CircleAvatar(
                  radius: 50.0,
                  // backgroundColor: const Color(0xFF778899),
                  backgroundImage: AssetImage(
                    "assets/images/q.png",
                    // fit: BoxFit.cover,
                  ), //For Image Asset
                ),

                // ),
                Text(
                  'Take Quizzes Daily',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Follow Us',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              'Rate Us',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
