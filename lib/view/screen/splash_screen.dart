import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen.dart';
import 'package:youtube_app/view/screen/home_page.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreenView(
          imageSrc: 'assets/images/img_1.png',
          navigateRoute: Home_Page(),
          logoSize: 200,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.black,
        )
    );
  }
}
