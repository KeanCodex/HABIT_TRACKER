import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Customs/Customized_widget.dart';

class PageIndicator extends StatelessWidget {
  PageIndicator({super.key, required this.controller});
  PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const WormEffect(
        radius: 1,
        dotWidth: 25,
        dotHeight: 5,
        activeDotColor: Colors.blueGrey,
        dotColor: orangeBG,
      ),
    );
  }
}
