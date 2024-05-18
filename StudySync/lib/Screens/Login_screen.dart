import 'package:codex_app/Components/BottomNav.dart';
import 'package:codex_app/Components/ButtonFields.dart';
import 'package:codex_app/Components/Checkbox.dart';
import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Functions/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Components/TextFields.dart';
import '../Customs/Customized_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userControl = TextEditingController();
  var passControl = TextEditingController();
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
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(15),
                            LabelText(
                              label: 'L O G I N',
                              fontsize: 35,
                              colors: greenBG,
                              fontweight: FontWeight.w900,
                            ),
                            LabelText(
                              label: 'TRACK YOUR PROGRESS!',
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
                          data: passControl.text),
                      const Gap(25),
                      Row(
                        children: [
                          CheckBoxs(ischeck: ischeck),
                          const Gap(10),
                          LabelText(
                            label: 'Remember Me',
                            fontsize: 15,
                          )
                        ],
                      ),
                      const Gap(35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: ButtonFields(
                          onPressed: () {
                            if (valkey.currentState!.validate()) {
                              toLogin(
                                  userControl, passControl, context, 'login');
                            }
                          },
                          btnLabel: 'L O G I N',
                        ),
                      ),
                      const Gap(50),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomNavigator(
            label: 'Not yet register?',
            contextNav: 'Sign up',
            onTaps: () => toSignUp(context),
          ),
        ],
      ),
    );
  }
}
