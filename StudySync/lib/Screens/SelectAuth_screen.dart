import 'dart:ui';

import 'package:codex_app/Components/ButtonCustom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/Containers.dart';
import '../Components/LabelStyle.dart';
import '../Customs/Customized_widget.dart';
import '../Functions/Navigation.dart';

class SelectAuth extends StatelessWidget {
  const SelectAuth({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'Assets/Images/back.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Containers(
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      height: 330,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Column(
                          children: [
                            const Gap(120),
                            Text(
                              'CodeSync',
                              style: GoogleFonts.bungee(
                                letterSpacing: 4,
                                fontSize: 35,
                                fontWeight: FontWeight.w100,
                                color: orangeBG,
                              ),
                            ),
                            LabelText(
                              label: 'STUDY HARDER',
                              letterSpacing: 4,
                              fontsize: 15,
                              colors: greenBG,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Gap(240),
                Image.asset(
                  'Assets/Gifs/physics.gif',
                  scale: 2.7,
                ),
                const Gap(100),
                Text(
                  'Track Progress Daily',
                  style: GoogleFonts.inter(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: whiteBG,
                  ),
                ),
                const Gap(25),
                LabelText(
                    textAlign: TextAlign.center,
                    colors: whiteBG,
                    fontsize: 18,
                    label:
                        'Seeing your accomplishments\n visually can be motivating and help\n you stay on track.'),
                const Gap(150),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonConfig(
                            onPressed: () => signUpAuth(context),
                            label: 'Register',
                            backColor: const Color.fromARGB(94, 255, 255, 255),
                            colors: whiteBG),
                        const Gap(150),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Gap(150),
                        ButtonConfig(
                            onPressed: () => loginAuth(context),
                            label: 'Sign in',
                            backColor: whiteBG,
                            colors: greenBG),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
