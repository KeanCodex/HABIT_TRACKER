import 'package:codex_app/Components/LabelStyle.dart';
import 'package:flutter/material.dart';

class OutlineBorder extends StatelessWidget {
  OutlineBorder(
      {super.key,
      required this.onPressed,
      this.text,
      required this.textColor,
      this.textSize});
  void Function()? onPressed;
  Color textColor;
  double? textSize;
  String? text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )),
        side: MaterialStateProperty.all(BorderSide(color: textColor)),
      ),
      child:
          LabelText(label: text ?? '', fontsize: textSize, colors: textColor),
    );
  }
}
