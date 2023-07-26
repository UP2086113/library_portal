import 'package:get/get.dart';

import '../models/author.dart';
import '../models/book.dart';
import '../models/book_details.dart';
import '../models/book_review.dart';
import '../models/genre.dart';
import 'genres_provider.dart';
import 'publishes_provider.dart';
import 'reviews_provider.dart';

class BookDetailsProvider extends GetxController {
  final PublishesProvider _publishesProvider;
  final GenresProvider _genresProvider;
  final ReviewsProvider _reviewsProvider;

  BookDetailsProvider({
    required publishesProvider,
    required genresProvider,
    required reviewsProvider,
  })  : _publishesProvider = publishesProvider,
        _genresProvider = genresProvider,
        _reviewsProvider = reviewsProvider;

  /// Fetch bookDetails for bookId
  Future<BookDetails> getBookDetails(int bkId) async {
    late List<Author?> bookAuthors;
    late List<Genre?> bookGenres;
    late List<BookReview> bookReviews;

    /// get and store the book for bkId from _publishesProvider
    final Book? book = _publishesProvider.getBook(bkId);
    bookAuthors = _publishesProvider.getBookAuthors(bkId);
    await Future.wait<void>([
      (() async => bookGenres = await _genresProvider.getBookGenres(bkId))(),
      (() async => bookReviews = await _reviewsProvider.getBookReviews(bkId))(),
    ]);

    return BookDetails(
      genres: bookGenres,
      authors: bookAuthors,
      reviews: bookReviews,
      book: book,
    );
  }
}
