import 'package:flutter/material.dart';
import 'package:linktest_app/src/page/homepage.dart';
import 'package:linktest_app/src/service/controller.dart';
import 'src/service/global.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:get/get.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends GetView<MyController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.vibrateOnSplashScreen();
    return Scaffold(
      body: AnimatedSplashScreen(
          splash: Image.asset('assets/linkologo.png'),
          duration: 3000,
          curve: Curves.easeInOut,
          splashIconSize: 40,
          splashTransition: SplashTransition.scaleTransition,
          animationDuration: const Duration(milliseconds: 1500),
          backgroundColor:  Colors.white,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: HomePage(),
      ),
    );
  }
}