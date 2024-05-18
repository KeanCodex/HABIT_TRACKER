import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ButtonFields extends StatelessWidget {
  ButtonFields({super.key, this.onPressed, required this.btnLabel});
  void Function()? onPressed;
  String btnLabel;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(greenBG),
          elevation: const MaterialStatePropertyAll(3),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.login_outlined,
            color: Colors.white,
            size: 20,
          ),
          const Gap(10),
          LabelText(
            label: btnLabel,
            colors: Colors.white,
            fontsize: 17,
          ),
        ],
      ),
    );
  }
}
