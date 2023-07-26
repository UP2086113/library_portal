import 'package:get/get.dart';

import '../config/constants.dart';
import '../models/author_review.dart';
import '../models/book_review.dart';

class ReviewsProvider extends GetxController {
  Future<List<BookReview>> getBookReviews(int bkId) async {
    return bookReviews.where((review) => review.bookId == bkId).toList();
  }

  List<AuthorReview> getAuthorReviews(int aId) {
    return authorReviews
        .where(
          (review) => review.aId == aId,
        )
        .toList();
  }
}
