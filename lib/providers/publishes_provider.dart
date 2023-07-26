import 'package:get/get.dart';

import '../config/constants.dart';
import '../models/author.dart';
import '../models/book.dart';

class PublishesProvider extends GetxController {
  static PublishesProvider instance = Get.find();

  var authors = <int, Author>{}.obs;

  var books = <int, Book>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  void _initializeData() {
    _initializeAuthorsMap();
    _initializeBooksMap();
  }

  void _initializeAuthorsMap() {
    for (var author in authorsList) {
      authors[author.id] = author;
    }
  }

  @override
  void onClose() {
    authors.clear();
    books.clear();
    super.onClose();
  }

  void _initializeBooksMap() {
    for (var book in bookList) {
      books[book.id] = book;
    }
  }

  Book? getBook(int bkId) => books[bkId];

  Author? getAuthor(int aId) => authors[aId];

  getBookAuthors(int authorId) {
    // var temp = bookList.firstWhere((book) => book.authorId == bkId);
    var author = bookList
        .where(
          (book) => book.authorId == authorId,
        )
        .toList();

    return author;
  }

  Future<List<Book>> getAuthorBooks(int aId) async {
    return bookList
        .where((book) => book.authorId == aId)
        .toList()
        .reversed
        .toList();
  }

  List<Book> getGenreBooks(int gId) {
    return bookList.where((book) => book.genreId.contains(gId)).toList();
  }

  List<Book> getTop5RatedBooks() {
    // Sort the books based on rating in descending order
    var temp = bookList;
    temp.sort((a, b) => b.rating.compareTo(a.rating));

    // Take the first 5 books from the sorted list
    return temp.take(5).toList();
    // return bookList.;
  }

  List<Book> getTop5NewBooks() {
    var temp = bookList;
    // Sort the books based on published date in descending order
    temp.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));

    // Take the last 5 books from the sorted list
    return temp.take(5).toList();
  }
}
