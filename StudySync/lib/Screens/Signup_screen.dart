import 'package:codex_app/Components/BottomNav.dart';
import 'package:codex_app/Components/ButtonFields.dart';
import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Functions/Navigation.dart';
import 'package:codex_app/Models/UserToken.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Components/TextFields.dart';
import '../Customs/Customized_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var userControl = TextEditingController();
  var passControl = TextEditingController();
  var passConfirm = TextEditingController();
  var nameControl = TextEditingController();

  var valkey = GlobalKey<FormState>();
  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'Assets/Images/study.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Form(
            key: valkey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(15),
                            LabelText(
                              label: 'S I G N - U P',
                              fontsize: 35,
                              colors: greenBG,
                              fontweight: FontWeight.w900,
                            ),
                            LabelText(
                              label: 'BEGIN YOUR JOURNEY!',
                              fontsize: 15,
                              letterSpacing: 2,
                              colors: greenBG,
                              fontweight: FontWeight.w900,
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                      TextFields(
                        control: nameControl,
                        hintText: 'Name',
                        isPassword: false,
                        isObscure: false,
                        data: nameControl.text,
                      ),
                      const Gap(25),
                      TextFields(
                        control: userControl,
                        hintText: 'Username',
                        isPassword: false,
                        isObscure: false,
                        data: userControl.text,
                      ),
                      const Gap(25),
                      TextFields(
                        control: passControl,
                        hintText: 'Password',
                        isPassword: true,
                        isObscure: true,
                        data: passControl.text,
                      ),
                      const Gap(25),
                      TextFields(
                        control: passConfirm,
                        hintText: 'Password Confirm',
                        isPassword: true,
                        isObscure: true,
                        data: passConfirm.text,
                        customValidator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required!';
                          }

                          if (value != passControl.text) {
                            return 'Passwords doesn\'t match!';
                          }
                          return null;
                        },
                      ),
                      const Gap(35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: ButtonFields(
                          onPressed: () {
                            if (valkey.currentState!.validate()) {
                              toSignUpConfirm(nameControl, userControl,
                                  passControl, context, 'signup');
                            }
                          },
                          btnLabel: 'S I G N   U P',
                        ),
                      ),
                      const Gap(30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomNavigator(
            label: 'Have already account?',
            contextNav: 'Login',
            onTaps: () => toLogins(context),
          ),
        ],
      ),
    );
  }
}
