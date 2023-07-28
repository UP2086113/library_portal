import 'package:get/get.dart';

import '../config/constants.dart';
import '../models/author.dart';
import '../models/book.dart';
import '../models/genre.dart';
import '../utils/enums/book_issue_status_enum.dart';

class PublishesController extends GetxController {
  static PublishesController instance = Get.find();

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

  Future<List<Author>> getBookAuthors(int authorId) async {
    // var temp = bookList.firstWhere((book) => book.id == authorId);
    var author = authorsList
        .where(
          (author) => author.id == authorId,
        )
        .toList();

    return author;
  }

  String getBookAuthor(int authorId) {
    // var temp = bookList.firstWhere((book) => book.id == authorId);
    Author author = authorsList.firstWhere(
      (author) => author.id == authorId,
    );

    return "${author.firstName} ${author.lastName}";
  }

  BookIssueStatus getBookIssueStatus(Book book) {
    if (book.returnedOn != null || book.issueDate == null) {
      return BookIssueStatus.RETURNED;
    } else {
      final isOverdue = book.returnedOn == null &&
          DateTime.now().isAfter(book.issueDate!.add(const Duration(days: 7)));
      if (isOverdue) {
        return BookIssueStatus.OVERDUE;
      } else {
        return BookIssueStatus.DUE;
      }
    }
  }

  Future<List<Book>> getAuthorBooks(int aId) async {
    return bookList
        .where((book) => book.authorId == aId)
        .toList()
        .reversed
        .toList();
  }

  List<Genre> getAuthorGenres(int authorId) {
    Set<Genre> genreSet = <Genre>{};

    for (var book in bookList) {
      if (book.authorId == authorId) {
        for (var genreId in book.genreId) {
          var data = getGenreById(genreId);
          if (data != null) {
            genreSet.add(data);
          }
        }
      }
    }

    return genreSet.toList();
  }

  Genre? getGenreById(int genreId) {
    for (var genre in genreList) {
      if (genre.id == genreId) {
        return genre;
      }
    }
    return null; // If genre with the specified ID is not found
  }

  List<Book> getBorrowedBooks() {
    return bookList.where((book) {
      if (book.issueDate != null) {
        return book.isBookIssued;
      }
      return false;
    }).toList();
  }

  List<Book> getGenreBooks(int gId) {
    return bookList.where((book) => book.genreId.contains(gId)).toList();
  }

  Future<List<Genre>> getGenre(List<int> genreIds) async {
    List<Genre> filteredGenres =
        genreList.where((genre) => genreIds.contains(genre.id)).toList();
    return filteredGenres;
  }

  Future<List<Book>> getTop5RatedBooks() async {
    // Sort the books based on rating in descending order
    var temp = bookList;
    temp.sort((a, b) => b.rating.compareTo(a.rating));

    // Take the first 5 books from the sorted list
    return temp.take(5).toList();
    // return bookList.;
  }

  Future<List<Book>> getTop5NewBooks() async {
    var temp = bookList;
    // Sort the books based on published date in descending order
    temp.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));

    // Take the last 5 books from the sorted list
    return temp.take(5).toList();
  }
}
