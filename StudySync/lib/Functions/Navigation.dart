import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codex_app/Components/BottomNavigate.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:codex_app/Models/UserToken.dart';
import 'package:codex_app/Screens/Login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/Signup_screen.dart';

//For Navition on signup/registration
void toSignUp(BuildContext context) async {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
}

List<UserToken> USERIDLIST = [];

void toSignUpConfirm(
  TextEditingController nameControl,
  TextEditingController userControl,
  TextEditingController passControl,
  BuildContext context,
  String msgType,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userControl.text, password: passControl.text);

    // Add the user's name to a Firestore collection
    await FirebaseFirestore.instance
        .collection('DataStore')
        .doc(userCredential.user!.uid)
        .set({
      'name': nameControl.text,
      'email': userControl.text,
    });

    confirmation(context, 'Successfully $msgType', true, 'signup');
  } on FirebaseAuthException catch (ex) {
    var msgtext;
    if (ex.message ==
        'The supplied auth credential is incorrect, malformed or has expired.') {
      msgtext = 'Invalid Credential';
    } else if (ex.message == 'The email address is badly formatted.') {
      msgtext = 'Incorrect Email';
    } else if (ex.message ==
        '[ Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later. ]') {
      msgtext = 'Account Temporarily Disabled';
    } else if (ex.message ==
        'The email address is already in use by another account.') {
      msgtext = 'Email already registered. Try another.';
    } else if (ex.message == 'Password should be at least 6 characters.') {
      msgtext = 'Password must be at least 6 characters.';
    } else {
      print(msgtext = ex.message);
    }

    confirmation(context, msgtext ?? '', false, 'not');
  }
}

//For Navition on sign in/login
void toLogins(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const LoginScreen()));
}

void toLogin(
  TextEditingController userControl,
  TextEditingController passControl,
  BuildContext context,
  String msgType,
) async {
  try {
    var data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userControl.text, password: passControl.text);

    USERIDLIST = [
      UserToken(data: data),
    ];

    confirmation(context, 'Successfully $msgType', true, 'login');
  } on FirebaseException catch (ex) {
    var msgtext;
    if (ex.message ==
        'The supplied auth credential is incorrect, malformed or has expired.') {
      msgtext = 'Invalid Credential';
    } else if (ex.message == 'The email address is badly formatted.') {
      msgtext = 'Incorrect Email';
    } else if (ex.message ==
        '[ Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later. ]') {
      msgtext = 'Account Temporarily Disabled';
    } else {
      msgtext = 'Unknown Error Occurred';
    }
    confirmation(context, msgtext ?? '', false, 'not');
  }
}

void toLoginAcc(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => BottomNav()));
}

void loginAuth(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const LoginScreen()));
}

void signUpAuth(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SignUpScreen()));
}

void logoutAuth(BuildContext context) {
  try {
    toLogoutAcc(context, 'Logout account? ', () async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  } on FirebaseAuthException catch (ex) {
    print('MAGPAKITAKA! ${ex.code}');
  }
}
