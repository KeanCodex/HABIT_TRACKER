import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Customs/Customized_widget.dart';
import 'LabelStyle.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator(
      {super.key,
      required this.label,
      required this.contextNav,
      required this.onTaps});
  String label, contextNav;
  void Function()? onTaps;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: Container(
          color: greenBG,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelText(
                label: label,
                fontsize: 15,
                colors: whiteBG,
              ),
              const Gap(5),
              InkWell(
                onTap: onTaps,
                child: LabelText(
                  label: contextNav,
                  colors: orangeBG,
                  fontsize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
