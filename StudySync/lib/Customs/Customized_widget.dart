import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Components/LabelStyle.dart';
import '../Components/OutlineBorderBtn.dart';
import '../Functions/Navigation.dart';

//Border Customized
const borderCustom =
    OutlineInputBorder(borderSide: BorderSide(color: dblueBG, width: 1.2));

//Text color
const blueBG = Color(0xff89CCC5);
const orangeBG = Color(0xffFF9F66);

const colorbg = Color(0xffE2B5A5);
const lightbrBG = Color(0xffDFD0B8);
const dblueBG = Color(0xff31363F);
const greenBG = Color(0xff3E4C50);
const whiteBG = Color(0xffFBF3D5);

void confirmation(
    BuildContext context, String textmsg, bool isValidate, String typeAuth) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
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
                  Image.asset(
                    isValidate
                        ? 'Assets/Gifs/Valid.gif'
                        : 'Assets/Gifs/Invalid.gif',
                    scale: 4,
                  ),
                  const Gap(15),
                  Align(
                    alignment: Alignment.center,
                    child: LabelText(
                      label: textmsg,
                      colors: Colors.white,
                      fontsize: 15,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            Center(
              child: OutlineBorder(
                onPressed: () {
                  if (typeAuth.contains('login')) {
                    toLoginAcc(context);
                  } else if (typeAuth.contains('signup')) {
                    toLogins(context);
                  } else {
                    Navigator.pop(context);
                  }
                },
                textColor: Colors.greenAccent,
                textSize: 14,
                text: 'Okay',
              ),
            )
          ],
        ),
      ),
    ),
  );
}

void deleteConfirm(
  BuildContext context,
  String textmsg,
  Function() delete,
) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
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
                  Image.asset(
                    'Assets/Gifs/Delete.gif',
                    scale: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: LabelText(
                        label: textmsg,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.redAccent,
                  textSize: 14,
                  text: 'Cancel',
                ),
                const Gap(50),
                OutlineBorder(
                  onPressed: () {
                    delete();
                    Navigator.pop(context);
                  },
                  textColor: Colors.greenAccent,
                  textSize: 14,
                  text: 'Okay',
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void toLogoutAcc(
  BuildContext context,
  String textmsg,
  Function() logout,
) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
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
                  Image.asset(
                    'Assets/Gifs/Logout.gif',
                    scale: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: LabelText(
                        label: textmsg,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.redAccent,
                  textSize: 14,
                  text: 'Cancel',
                ),
                const Gap(70),
                OutlineBorder(
                  onPressed: () {
                    logout();
                    Navigator.pop(context);
                  },
                  textColor: Colors.greenAccent,
                  textSize: 14,
                  text: 'Yes',
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
