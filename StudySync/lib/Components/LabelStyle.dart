import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  LabelText(
      {super.key,
      required this.label,
      this.fontsize,
      this.colors,
      this.fontweight,
      this.textAlign,
      this.height,
      this.letterSpacing});
  String label;
  Color? colors;
  double? fontsize;
  FontWeight? fontweight;
  TextAlign? textAlign;
  double? height;
  double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.mulish(
        color: colors,
        fontSize: fontsize,
        fontWeight: fontweight,
        height: height,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
    );
  }
}
