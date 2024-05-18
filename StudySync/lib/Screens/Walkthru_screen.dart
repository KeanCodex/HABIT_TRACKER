import 'package:codex_app/Components/PageIndicator.dart';
import 'package:codex_app/Components/PvContainer.dart';
import 'package:codex_app/Components/SkipButton.dart';
import 'package:codex_app/Customs/Customized_widget.dart';
import 'package:flutter/material.dart';

class Walkthru extends StatefulWidget {
  const Walkthru({Key? key}) : super(key: key);

  @override
  State<Walkthru> createState() => _WalkthruState();
}

class _WalkthruState extends State<Walkthru> {
  var controller = PageController();
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      if (controller.page == controller.page!.round()) {
        setState(() {
          isLastPage = controller.page == 2;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              PvContainer(
                countPage: 1,
                fontsize: 22,
                msgfontsize: 15,
                fontweight: FontWeight.w600,
                title: 'Welcome to StudySync !',
                msgcontext:
                    'This app will help you keep an\norganized study routine, as you build your\nown habits.',
                textalign: TextAlign.center,
                color: dblueBG,
              ),
              PvContainer(
                countPage: 2,
                fontsize: 22,
                msgfontsize: 15,
                fontweight: FontWeight.w600,
                title: 'Academic Empowerment',
                msgcontext:
                    'We offer personalized study plans\n and progress tracking for improved academic\n habits and achievements.',
                textalign: TextAlign.center,
                color: dblueBG,
              ),
              PvContainer(
                countPage: 3,
                fontsize: 22,
                msgfontsize: 15,
                fontweight: FontWeight.w600,
                title: 'Habit Planner',
                msgcontext:
                    'Plan your habits your way. Mark successes,\n failures, and reflections daily.\n Foster accountability and adapt for success.',
                textalign: TextAlign.center,
                color: dblueBG,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  PageIndicator(controller: controller),
                  const Spacer(),
                  isLastPage
                      ? SkipButton(
                          controller: controller,
                          isSkip: 'done',
                        )
                      : SkipButton(
                          controller: controller,
                          isSkip: 'skip',
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
