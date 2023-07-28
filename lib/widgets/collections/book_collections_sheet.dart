import 'package:flutter/material.dart';
import 'package:library_portal/config/constants.dart';
import 'package:library_portal/config/controllers.dart';

import '../../../models/book.dart';
import '../../../utils/helper.dart';
import 'book_collections_list.dart';

class BookCollectionsSheet extends StatelessWidget {
  const BookCollectionsSheet({super.key});

  Padding buildCollectionName(String text, context, {author = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Text(
        text,
        style: author
            ? const TextStyle(color: Colors.white, fontSize: 20)
            : Theme.of(context).textTheme.displaySmall,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),

          //New collections title
          buildCollectionName("New Collections", context),

          const SizedBox(height: 10),

          //New collections list
          FutureBuilder(
            future: publisherController.getTop5NewBooks(),
            initialData: [bookList],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data as List<Book>;
                return BookCollectionList(
                  books: data,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          const SizedBox(height: 20),

          //Top Rated title
          buildCollectionName("Top Rated", context),

          const SizedBox(height: 10),

          //Top Rated list
          FutureBuilder(
            future: publisherController.getTop5RatedBooks(),
            initialData: [bookList],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data as List<Book>;
                return BookCollectionList(
                  books: data,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
