
import 'package:flutter/widgets.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/sign_up/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/dsa_quiz/dsa_screen.dart';
import 'screens/dsa_date_quiz/dsa_date_01.dart';
import 'screens/result/result_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DsaScreen.routeName: (context) => DsaScreen(),
  DsaDateScreen.routeName: (context) => DsaDateScreen(),
  ResultScreen.routeName: (context) => ResultScreen(),
};
