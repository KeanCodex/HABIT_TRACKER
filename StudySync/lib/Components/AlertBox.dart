import 'package:codex_app/Components/TextFields.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'LabelStyle.dart';
import 'OutlineBorderBtn.dart';

class UpdateDialog extends StatelessWidget {
  UpdateDialog(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.title,
      required this.onSave,
      required this.onCancel,
      required this.caption});
  TextEditingController controller;
  String hintText, title, caption;
  VoidCallback onSave;
  VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xff2A303E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(15),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        title == 'UPDATE TASK:'
                            ? Icons.edit_note_outlined
                            : Icons.create_new_folder_outlined,
                        color: lightbrBG,
                      ),
                      const Gap(5),
                      Align(
                        alignment: Alignment.topLeft,
                        child: LabelText(
                          label: title,
                          colors: Colors.white,
                          fontsize: 15,
                          fontweight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  const Divider(),
                  const Gap(5),
                  TextFields(
                      control: controller,
                      hintText: hintText,
                      isPassword: false,
                      isObscure: false,
                      data: ''),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: LabelText(
                        label: caption,
                        colors: Colors.white,
                        fontsize: 15,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineBorder(
                  onPressed: onCancel,
                  textColor: Colors.redAccent,
                  textSize: 14,
                  text: 'Cancel',
                ),
                const Gap(50),
                OutlineBorder(
                  onPressed: onSave,
                  textColor: Colors.greenAccent,
                  textSize: 14,
                  text: 'Save',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
