import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mad_assignment_02/no_account.dart';
import 'package:mad_assignment_02/screens/home/home_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../form_error.dart';
import '../../custom_surfix_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '/helper/keyboard.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String errorText;

  bool circular = false;
  bool remember = false;

  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    // autoLogIn();
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
login()async{
  await Firebase.initializeApp();

  try {
    print(email);
    print(password);
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}
  

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             buildEmailFormField(),
         
            SizedBox(height: getProportionateScreenHeight(20)),
             buildPasswordFormField(),
            
            SizedBox(height: getProportionateScreenHeight(20)),
            // FormError(errors: errors),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                login();
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, //button's fill color
                shadowColor: Colors.black, //specify the button's elevation color
                elevation: 4.0, //buttons Material shadow
                minimumSize: Size(300,
                    40), //specify the button's first: width and second: height
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        35.0)), // set the buttons shape. Make its birders rounded etc
                enabledMouseCursor:
                    MouseCursor.defer, //used to construct ButtonStyle.mouseCursor
                disabledMouseCursor: MouseCursor
                    .uncontrolled, //used to construct ButtonStyle.mouseCursor
                visualDensity: VisualDensity(
                    horizontal: 0.0,
                    vertical: 0.0), //set the button's visual density
                tapTargetSize: MaterialTapTargetSize
                    .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                animationDuration:
                    Duration(milliseconds: 100), //the buttons animations duration
                enableFeedback: true, //to set the feedback to true or false
                alignment: Alignment.center, //set the button's child Alignment
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            NoAccountText(),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: kSecondaryColor),
        filled: true,
        fillColor: Colors.white,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
        print(email);
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: kSecondaryColor),
        filled: true,
        fillColor: Colors.white,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
