import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:codex_app/Screens/SelectAuth_screen.dart';
import 'package:flutter/material.dart';
import 'LabelStyle.dart';

class SkipButton extends StatelessWidget {
  SkipButton({Key? key, this.controller, this.isSkip}) : super(key: key);

  final PageController? controller;
  final String? isSkip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSkip == 'skip') {
          if (controller != null) {
            controller!.jumpToPage(2);
          }
        } else if (isSkip == 'done') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SelectAuth()));
        }
      },
      child: LabelText(
        label: isSkip ?? '',
        fontsize: 15,
        colors: dblueBG,
      ),
    );
  }
}
