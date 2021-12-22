import 'package:flutter/material.dart';
import 'package:satc/modules/login/login_screen.dart';
import 'package:satc/widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFFffffff),
      body: SplashBody(),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(
      const Duration(milliseconds: 6000),
      () {},
    );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
