import './pages/splash/splash_page.dart';
import './pages/login/login_page.dart';
import 'package:flutter/material.dart';
import './routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lembretes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.INITIAL: ((context) => const SplashPage()),
        Routes.LOGIN: ((context) => const LoginPage()),
      },
      initialRoute: Routes.INITIAL,
    );
  }
}
