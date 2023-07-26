import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../ui/screens/primary/authors_gallery_screen.dart';
import '../ui/screens/primary/book_collections_screen.dart';
import '../ui/screens/primary/genre_books_screen.dart';
import '../ui/screens/primary/member_bookshelf_screen.dart';
import '../ui/screens/primary/member_profile_screen.dart';

class BottomNavBarController extends GetxController {
  static BottomNavBarController instance = Get.find();

  final pageController = PageController();

  final List<Widget> pages = [
    const BookCollectionsScreen(),
    GenreBooksScreen(),
    const AuthorsGalleryScreen(),
    const MemberBookshelfScreen(),
    const MemberProfileScreen()
  ];

  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
    // pageController.
  }
}
