import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/back.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.size.height * 0.15),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/login_back.png',
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome to Library\nPortal",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          minimumSize: Size(Get.size.width / 2, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Get.to(() => const HomeScreen());
                      },
                      child: Text("Let's Go",
                          style: Get.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white)))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
