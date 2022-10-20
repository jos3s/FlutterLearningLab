import 'package:flutter/cupertino.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/LearningLab.png',
      height: 100,
      width: 100,
    );
  }
}
