import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/config/controllers.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: PageView(
          controller: navBarController.pageController,
          onPageChanged: navBarController.changePage,
          children: navBarController.pages,
        ),
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: Colors.white,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.menu_book_outlined),
              title: const Text('Library'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_pin_outlined),
              title: const Text('Authors'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.book_outlined),
              title: const Text('BookShelf'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_pin_outlined),
              title: const Text('Profile'),
            ),
          ],
          currentIndex: navBarController.selectedIndex.value,
          onTap: (index) {
            navBarController.changePage(index);
            navBarController.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        )));
  }
}
