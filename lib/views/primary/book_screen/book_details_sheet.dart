import 'package:flutter/material.dart';
import 'package:library_portal/config/controllers.dart';
import 'package:library_portal/models/author.dart';
import 'package:library_portal/models/book.dart';
import 'package:library_portal/models/genre.dart';

import '../../../config/constants.dart';
import '../../../utils/helper.dart';
import '../../../widgets/common/genre_chips.dart';
import '../../../widgets/common/ratings.dart';

class BookDetailsSheet extends StatelessWidget {
  final Book book;

  const BookDetailsSheet({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White Details Card
        Positioned.fill(
          top: 65,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: buildBookDetails(context),
          ),
        ),

        //Book image
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 230,
            width: 155,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Column buildBookDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 175),

        //Book Title
        Text(
          book.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 5),

        //Book author

        FutureBuilder(
          future: publisherController.getBookAuthors(book.authorId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data as List<Author>;
              log.i("Author Data: $data");

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: data
                    .map(
                      (author) => Text(
                        "${author.firstName} ${author.lastName}",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                    .toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

        const SizedBox(height: 10),

        //Published date
        Text(
          "Published at ${Helper.datePresenter(book.publishedDate)}",
        ),

        const SizedBox(height: 10),

        //Book ratings
        Ratings(rating: book.rating),

        const SizedBox(height: 15),

        FutureBuilder(
          future: publisherController.getGenre(book.genreId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data as List<Genre>;
              return GenreChips(
                  color: Theme.of(context).primaryColor, genres: data);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        const SizedBox(height: 15),

        Text(
          book.bio,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
