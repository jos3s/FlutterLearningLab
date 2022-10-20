import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool textAnimated = false;
  bool logoAnimated = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        textAnimated = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          logoAnimated = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(seconds: 1),
              bottom: textAnimated ? 250 : -500,
              left: 0,
              right: 0,
              child: const Text(
                'Flutterama: Decomplicando a '
                'programação em Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              )),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            top: textAnimated ? 200 : -500,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/LearningLab.png',
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
