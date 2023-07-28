import 'package:flutter/material.dart';
import 'package:library_portal/widgets/common/ratings.dart';

import '../../../config/constants.dart';
import '../../../models/book.dart';
import '../../../utils/helper.dart';

class BooksList extends StatelessWidget {
  final List<Book> books;

  const BooksList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: books.length,
      separatorBuilder: (ctx, i) => const Divider(
        thickness: 1,
        height: 36,
      ),
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {
          //TODO: add book on tap here
          log.d(books[i]);
        },
        child: BooksListItem(
          bookPublishedDate: Helper.datePresenter(books[i].publishedDate),
          bookTitle: books[i].name,
          bookRating: books[i].rating,
          bookImageUrl: books[i].imageUrl,
        ),
      ),
    );
  }
}

class BooksListItem extends StatelessWidget {
  const BooksListItem({
    Key? key,
    required this.bookRating,
    required this.bookPublishedDate,
    required this.bookTitle,
    required this.bookImageUrl,
  }) : super(key: key);

  final int bookRating;
  final String bookPublishedDate;
  final String bookTitle;
  final String bookImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Helper.hPadding, Helper.hPadding, Helper.hPadding, 0),
      child: Row(
        children: [
          //Book Image
          Container(
            height: 160,
            width: 115,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(bookImageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(width: 20),

          //Titles
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Book author
              Text(
                bookPublishedDate,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 8),

              //Book Title
              SizedBox(
                width: 130,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        bookTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              //Book rating
              Ratings(rating: bookRating),
            ],
          ),

          const Spacer(),

          //Arrow
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black26,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
