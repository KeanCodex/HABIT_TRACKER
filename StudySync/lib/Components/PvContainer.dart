import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Components/NeoBox.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PvContainer extends StatelessWidget {
  PvContainer(
      {super.key,
      this.color,
      this.fontsize,
      this.msgfontsize,
      this.msgcontext,
      this.title,
      this.fontweight,
      this.textalign,
      this.countPage});

  Color? color;
  String? title, msgcontext;
  double? fontsize, msgfontsize, countPage;
  FontWeight? fontweight;
  TextAlign? textalign;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          NeoBox(
            child: Image.asset(
              countPage == 1
                  ? 'Assets/Images/intro.png'
                  : countPage == 2
                      ? 'Assets/Images/study.png'
                      : 'Assets/Images/planner.png',
              scale: 5,
            ),
          ),
          const Gap(20),
          LabelText(
            label: title ?? '',
            fontweight: fontweight,
            fontsize: fontsize,
            colors: color,
            textAlign: textalign,
          ),
          const Gap(25),
          //Context
          LabelText(
            label: msgcontext ?? '',
            fontsize: msgfontsize,
            colors: color,
            textAlign: textalign,
            height: 2,
          ),
          const Gap(25),
        ],
      ),
    );
  }
}
