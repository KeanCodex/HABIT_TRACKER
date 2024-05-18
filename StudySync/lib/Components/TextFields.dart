import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Customs/Customized_widget.dart';

class TextFields extends StatefulWidget {
  TextFields({
    super.key,
    required this.control,
    required this.hintText,
    required this.isPassword,
    required this.isObscure,
    void Function()? onToggled,
    required this.data,
    this.customValidator,
  });

  Function(String?)? customValidator;
  TextEditingController control;
  String? hintText, data;
  bool isPassword, isObscure;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool toshowpass = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscure,
      controller: widget.control,
      decoration: InputDecoration(
          hintStyle: GoogleFonts.montserrat(),
          hintText: widget.hintText,
          border: borderCustom,
          enabledBorder: borderCustom,
          focusedBorder: borderCustom,
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isObscure = !widget.isObscure;
                    });
                  },
                  icon: Icon(widget.isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined))
              : null),
      validator: widget.customValidator != null
          ? (value) => widget.customValidator!(value)
          : (data) {
              if (data == null || data.isEmpty) {
                return '${widget.hintText} is required!';
              }
              return null;
            },
    );
  }
}
