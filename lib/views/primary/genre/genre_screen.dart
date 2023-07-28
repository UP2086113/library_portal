import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/config/constants.dart';
import 'package:library_portal/config/controllers.dart';
import 'package:library_portal/views/primary/book_screen/books_list_screen.dart';

import '../../../models/book.dart';
import '../../../models/genre.dart';
import '../../../widgets/common/search_textfield.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = genreList;
  int selectedGenreId = 2;
  List<Book> filteredBooks = []; // Books filtered by selected genre
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filtered book list with books of the selected genre
    filteredBooks = publisherController.getGenreBooks(selectedGenreId);
  }

  void changeGenre(int genreId) {
    setState(() {
      selectedGenreId = genreId;
      filteredBooks = publisherController.getGenreBooks(selectedGenreId);
    });
  }

  void filterBooksBySearch(String searchText) {
    setState(() {
      filteredBooks = bookList.where((book) {
        final title = book.name.toLowerCase();
        final subtitle = book.bio.toLowerCase();
        final search = searchText.toLowerCase();
        return title.contains(search) || subtitle.contains(search);
      }).toList();
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Genres',
              style: Get.textTheme.headlineLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (Genre genre in genres)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          onPressed: () => changeGenre(genre.id),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: genre.id == selectedGenreId
                                  ? Colors.lightGreen
                                  : Colors.grey.shade400,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(genre.name),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            //Search Field
            SearchTextField(
              fillColor: Colors.green.shade50,
              inputTextColor: Theme.of(context).primaryColor,
              hintTextColor: Colors.black38,
              controller: searchController,
              onChanged: filterBooksBySearch,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      return BookItem(book: filteredBooks[index]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
