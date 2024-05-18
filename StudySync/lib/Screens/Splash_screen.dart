import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Components/NeoBox.dart';
import 'package:codex_app/Screens/Walkthru_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Customs/Customized_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const Walkthru()));
        },
        child: Stack(
          children: [
            Image.asset(
              'Assets/Images/river.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              opacity: const AlwaysStoppedAnimation(.9),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: LabelText(
                  fontsize: 14,
                  label: 'Powered by@StudySync',
                  colors: whiteBG,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeoBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Image.asset(
                        'Assets/Gifs/physics.gif',
                        scale: 5,
                      ),
                    ),
                  ),
                  const Gap(25),
                  LabelText(
                    label: 'StudySync',
                    fontsize: 30,
                    fontweight: FontWeight.w700,
                    colors: whiteBG,
                  ),
                  const Gap(3),
                  LabelText(
                    label: 'We help you stay consistence!',
                    fontsize: 15,
                    fontweight: FontWeight.w400,
                    colors: whiteBG,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
