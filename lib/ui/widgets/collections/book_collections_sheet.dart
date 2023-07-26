import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../models/book.dart';
import '../../../providers/publishes_provider.dart';
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
          Consumer<PublishesProvider>(
            builder: (ctx, pubProv, child) => StreamBuilder<List<Book>>(
              stream: pubProv.getTop5NewBooks(),
              initialData: [Book.initialData()],
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return BookCollectionList(
                    books: snapshot.data,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          //Top Rated title
          buildCollectionName("Top Rated", context),

          const SizedBox(height: 10),

          //Top Rated list
          Consumer<PublishesProvider>(
            builder: (ctx, pubProv, child) => StreamBuilder<List<Book>>(
              stream: pubProv.getTop5RatedBooks(),
              initialData: [Book.initialData()],
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return BookCollectionList(
                    books: snapshot.data,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
