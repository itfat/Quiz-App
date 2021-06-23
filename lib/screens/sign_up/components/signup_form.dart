import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../custom_surfix_icon.dart';
import '../../../have_account.dart';
import '../../../size_config.dart';
import '../../../custom_surfix_icon.dart';
import '../../home/home_screen.dart';
import '../../../form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
// import '/helper/keyboard.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String errorText;
  late String conform_password;

  bool circular = false;
  bool remember = false;

  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    // autoSignUp();
  }

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  signUp() async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      print('No user found for that email.');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildEmailFormField(),

            SizedBox(height: getProportionateScreenHeight(20)),
            buildPasswordFormField(),

            SizedBox(height: getProportionateScreenHeight(20)),
            // FormError(errors: errors),
            confirmPasswordFormField(),

            SizedBox(height: getProportionateScreenHeight(20)),

            ElevatedButton(
              onPressed: () {
                signUp();
                // Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
              },
              child: Text(
                'SignUp',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, //button's fill color
                shadowColor:
                    Colors.black, //specify the button's elevation color
                elevation: 4.0, //buttons Material shadow
                minimumSize: Size(300,
                    40), //specify the button's first: width and second: height
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        35.0)), // set the buttons shape. Make its birders rounded etc
                enabledMouseCursor: MouseCursor
                    .defer, //used to construct ButtonStyle.mouseCursor
                disabledMouseCursor: MouseCursor
                    .uncontrolled, //used to construct ButtonStyle.mouseCursor
                visualDensity: VisualDensity(
                    horizontal: 0.0,
                    vertical: 0.0), //set the button's visual density
                tapTargetSize: MaterialTapTargetSize
                    .padded, // set the MaterialTapTarget size. can set to: values, padded and shrinkWrap properties
                animationDuration: Duration(
                    milliseconds: 100), //the buttons animations duration
                enableFeedback: true, //to set the feedback to true or false
                alignment: Alignment.center, //set the button's child Alignment
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            HaveAccountText(),
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
        } else if (value.length <= 8) {
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

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password != conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        focusColor: kdefinedColor,
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
