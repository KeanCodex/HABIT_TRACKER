import 'package:flutter/material.dart';

import '../Customs/Customized_widget.dart';

class CheckBoxs extends StatefulWidget {
  CheckBoxs({super.key, required this.ischeck});
  bool ischeck;
  @override
  State<CheckBoxs> createState() => _CheckBoxsState();
}

class _CheckBoxsState extends State<CheckBoxs> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            widget.ischeck = !widget.ischeck;
          });
        },
        child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    color: widget.ischeck ? dblueBG : dblueBG, width: 1.3)),
            child: widget.ischeck
                ? const Icon(
                    Icons.check,
                    color: dblueBG,
                    size: 20,
                  )
                : null));
  }
}
