import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/views/primary/book_screen/book_details_screen.dart';

import '../../../models/book.dart';
import '../../../utils/helper.dart';
import '../../config/constants.dart';

class BookCollectionList extends StatelessWidget {
  final List<Book> books;

  const BookCollectionList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
          child: InkWell(
            onTap: () {
              log.d(books[i]);

              Get.to(BookDetailsScreen(book: books[i]));
            },
            child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 140,
                child: Image.network(
                  books[i].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
