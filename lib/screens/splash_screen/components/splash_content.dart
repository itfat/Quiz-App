import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mad_assignment_02/screens/login/login_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          // Spacer(),
          SizedBox(
            height: getProportionateScreenHeight(130)
          ),
          // Spacer(flex: 2,),
          SvgPicture.asset(
            "assets/images/undraw_researching_22gp.svg",
            height: getProportionateScreenHeight(200),
            width: getProportionateScreenWidth(170),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50)
          ),
        
          Text(
            "Welcome to Quiz Master",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
            SizedBox(
            height: getProportionateScreenHeight(30)
          ),
          Text(
            "Isn't life a collection of weird quizzes with no answers to half of the questions.",
            textAlign: TextAlign.center,
            style: TextStyle(
           
              color: kPrimaryColor,

            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50)
          ),
          ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                  // color: Colors.white,
                  // style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(Color(0xFF00137d)),
                  //     // textStyle:
                  //     //     MaterialStateProperty.all(TextStyle(fontSize: 20))
                  //         ),
                  style: ElevatedButton.styleFrom(
    primary: kPrimaryColor, //button's fill color
    shadowColor: Colors.black, //specify the button's elevation color
    elevation: 4.0, //buttons Material shadow
    minimumSize: Size(300, 40), //specify the button's first: width and second: height
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)), // set the buttons shape. Make its birders rounded etc
    enabledMouseCursor: MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
    disabledMouseCursor: MouseCursor.uncontrolled, //used to construct ButtonStyle.mouseCursor
    visualDensity: VisualDensity(horizontal: 0.0, vertical: 0.0), //set the button's visual density
    tapTargetSize: MaterialTapTargetSize.padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
    animationDuration: Duration(milliseconds: 100), //the buttons animations duration
    enableFeedback: true, //to set the feedback to true or false
    alignment: Alignment.center, //set the button's child Alignment
  ),
                ),
               
                
        ],
      //  ),
    ); 
    
  }
}
