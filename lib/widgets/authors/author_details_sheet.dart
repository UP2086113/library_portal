import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/views/primary/book_screen/book_details_screen.dart';

import '../../../models/book.dart';
import '../../../models/genre.dart';
import '../../../utils/helper.dart';
import '../../views/primary/book_screen/books_list_screen.dart';
import '../common/genre_chips.dart';
import '../common/ratings.dart';

class AuthorDetailsSheet extends StatelessWidget {
  final String authorImageUrl;
  final String authorName;
  final int authorAge;
  final String authorCountry;
  final int authorRating;
  final List<Genre> genres;
  final List<Book> books;

  const AuthorDetailsSheet({
    Key? key,
    required this.authorImageUrl,
    required this.authorName,
    required this.authorAge,
    required this.authorCountry,
    required this.authorRating,
    required this.genres,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White Details Card
        Positioned.fill(
          top: 60,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: buildAuthorDetails(context),
          ),
        ),

        //Author image
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 110,
            backgroundImage: NetworkImage(authorImageUrl),
          ),
        ),
      ],
    );
  }

  Column buildAuthorDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 175),

        //Author Name
        Text(
          authorName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),

        const SizedBox(height: 5),

        //Author age
        Text(
          "$authorAge yrs old",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 10),

        //Author country
        Text(
          authorCountry,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 10),

        //Author ratings
        Ratings(rating: authorRating),

        const SizedBox(height: 15),

        GenreChips(color: Theme.of(context).primaryColor, genres: genres),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Published Books",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(BookListScreen(
                  books: books,
                ));
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("View all"),
            ),
          ],
        ),

        const SizedBox(height: 15),

        SizedBox(
            height: 220,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < (books.length == 1 ? 1 : 2); i++)
                  GestureDetector(
                    onTap: () {
                      Get.to(BookDetailsScreen(book: books[i]));
                    },
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 160,
                            width: 115,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(books[i].imageUrl),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          const SizedBox(height: 5),

                          //Book name
                          Text(
                            books[i].name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 2),

                          //Book ratings
                          Ratings(rating: books[i].rating, size: 18),
                        ],
                      ),
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}
