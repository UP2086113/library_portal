import 'package:get/get.dart';
import 'package:library_portal/providers/publishes_provider.dart';
import 'package:library_portal/providers/reviews_provider.dart';

import '../models/author.dart';
import '../models/author_details.dart';
import '../models/author_review.dart';
import '../models/book.dart';
import '../models/genre.dart';
import 'genres_provider.dart';

class AuthorDetailsProvider extends GetxController {
  final PublishesProvider _publishesProvider;
  final GenresProvider _genresProvider;
  final ReviewsProvider _reviewsProvider;

  AuthorDetailsProvider({
    required publishesProvider,
    required genresProvider,
    required reviewsProvider,
  })  : _publishesProvider = publishesProvider,
        _genresProvider = genresProvider,
        _reviewsProvider = reviewsProvider;

  /// Fetch bookDetails for bookId
  Future<AuthorDetails> getAuthorDetails(int aId) async {
    late List<Book?> authorBooks;
    late List<Genre?> authorGenres;
    late List<AuthorReview?> authorReviews;
    final Author? author = _publishesProvider.getAuthor(aId);

    await Future.wait<void>([
      (() async =>
          authorBooks = await _publishesProvider.getAuthorBooks(aId))(),
      (() async => authorGenres = await _genresProvider.getAuthorGenres(aId))(),
      (() async =>
          authorReviews = await _reviewsProvider.getAuthorReviews(aId))(),
    ]);

    return AuthorDetails(
      genres: authorGenres,
      books: authorBooks,
      reviews: authorReviews,
      author: author,
    );
  }
}
