import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonConfig extends StatelessWidget {
  ButtonConfig(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.colors,
      required this.backColor});
  void Function()? onPressed;
  String label;
  Color colors, backColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(backColor),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)))),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: colors,
            ),
          )),
    );
  }
}
