import 'package:flutter/material.dart';

import '../../../utils/helper_functions.dart';
import '../animations/change_screen_animation.dart';
import 'login_content.dart';

class TopText extends StatefulWidget {
  const TopText({Key? key}) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  @override
  void initState() {
    ChangeScreenAnimation.topTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunctions.wrapWithAnimatedBuilder(
      animation: ChangeScreenAnimation.topTextAnimation,
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0, left: 20),
        child: Text(
          ChangeScreenAnimation.currentScreen == Screens.createAccount
              ? 'Create\nAccount'
              : 'Welcome\nBack',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
