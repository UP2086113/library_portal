import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_portal/controllers/bottom_nav_bar_controller.dart';
import 'package:library_portal/views/primary/splash_screen.dart';

import 'controllers/publishes_controller.dart';

void main() {
  runApp(const MyApp());
  Get.lazyPut(() => BottomNavBarController());
  Get.lazyPut(() => PublishesController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitialApp();
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library Portal',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[800],
        textTheme: TextTheme(
          displayLarge: GoogleFonts.literata(
            textStyle: const TextStyle(
              fontSize: 50,
              letterSpacing: .5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          displayMedium: GoogleFonts.literata(
            textStyle: const TextStyle(
              fontSize: 30,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          displaySmall: GoogleFonts.openSans(
            textStyle: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xff30B77E),
        fontFamily: GoogleFonts.openSans().fontFamily,
        iconTheme: IconThemeData(color: Colors.grey[800]),
      ),
      home: const SplashScreen(),
    );
  }
}
