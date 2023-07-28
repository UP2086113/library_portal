import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/widgets/common/ratings.dart';

import '../../../models/book.dart';
import '../../../utils/helper.dart';
import 'book_details_screen.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetailsScreen(book: book));
      },
      child: Row(
        children: [
          Container(
            height: 160,
            width: 115,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Helper.datePresenter(book.publishedDate),
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4.0),
                Text(
                  book.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 22.0),
                ),
                const SizedBox(height: 4.0),
                Ratings(rating: book.rating)
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

class BookListScreen extends StatelessWidget {
  final List<Book> books;

  const BookListScreen({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Published Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookItem(book: books[index]);
        },
      ),
    );
  }
}
