import 'dart:math';
import 'package:codex_app/Components/LabelStyle.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartBox extends StatelessWidget {
  final String taskQuest;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartBox({
    super.key,
    required this.taskQuest,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn
              ? Colors.grey[700]
              : const Color.fromARGB(44, 164, 167, 189),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Image.asset(
                iconPath,
                height: 65,
                color: powerOn ? Colors.white : Colors.grey.shade700,
              ),

              // smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: LabelText(
                          label: taskQuest,
                          fontweight: FontWeight.w600,
                          fontsize: 17,
                          colors: powerOn ? Colors.white : dblueBG,
                        )),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

List mySmartDevices = [
  ["Notes", "Assets/Images/exam.png", true],
  ["Read", "Assets/Images/book.png", false],
  ["Quiz", "Assets/Images/online.png", false],
  ["Test", "Assets/Images/test.png", false],
  ["Study", "Assets/Images/microscope.png", false],
  ["Write", "Assets/Images/writing.png", false],
];
