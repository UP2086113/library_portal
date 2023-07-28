import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/views/primary/bookshelf_screen.dart/member_bookshelf_screen.dart';
import 'package:library_portal/views/primary/profile_screen.dart';

import '../views/primary/author_screen/authors_screen.dart';
import '../views/primary/book_screen/book_collections_screen.dart';
import '../views/primary/genre/genre_screen.dart';

class BottomNavBarController extends GetxController {
  static BottomNavBarController instance = Get.find();

  final pageController = PageController();

  final List<Widget> pages = [
    const BookCollectionsScreen(), // Example page 1
    const GenreScreen(), // Example page 2
    const AuthorsScreen(), // Example page 3
    const BookshelfScreen(), // Example page 2
    const ProfileScreen(), // Example page 3
  ];

  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
    // pageController.
  }
}
