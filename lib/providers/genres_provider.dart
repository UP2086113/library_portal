import 'dart:collection';

import 'package:get/get.dart';

import '../models/genre.dart';

class GenresProvider extends GetxController {
  static GenresProvider instance = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initializeData();
  }

  final Map<int, Genre> _genres = {};

  UnmodifiableMapView<int, Genre> get genresMap => UnmodifiableMapView(_genres);

  UnmodifiableListView<Genre> get genres =>
      UnmodifiableListView(_genres.values);

  int get activeGenreId => genres[_activeIndex].id;

  void _initializeData() {
    _initializeGenresMap();
  }

  void _initializeGenresMap() {
    _dataRepository.genresStream().listen((genres) {
      for (var genre in genres) {
        _genres[genre.id] = genre;
      }
    });
  }

  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  bool isActiveIndex(int i) => _activeIndex == i;

  setActiveIndex(int newIndex) {
    _activeIndex = newIndex;
  }

  Future<List<Genre?>> getBookGenres(int bkId) async {
    List<Genre?> bookGenres = [];
    //Future based
    await for (List<int> genreIds
        in _dataRepository.bookGenresStream(id: bkId)) {
      for (var gId in genreIds) {
        bookGenres.add(_genres[gId]);
      }
    }
    //Stream based code
    //_dataRepository.bookGenresStream(id: bkId).forEach((gId) => bookGenres.add(_genres[gId]));
    return bookGenres;
  }

  Future<List<Genre?>> getAuthorGenres(int aId) async {
    List<Genre?> authorGenres = [];
    //Future based
    await for (List<int> genreIds
        in _dataRepository.authorGenresStream(id: aId)) {
      for (var gId in genreIds) {
        authorGenres.add(_genres[gId]);
      }
    }
    //Stream based code
    //_dataRepository.bookGenresStream(id: bkId).forEach((gId) => bookGenres.add(_genres[gId]));
    return authorGenres;
  }

  Future<List<Genre?>> getMemberGenres(int mId) async {
    List<Genre?> memberGenres = [];
    //Future based
    await for (List<int> genreIds
        in _dataRepository.memberGenresStream(id: mId)) {
      for (var gId in genreIds) {
        memberGenres.add(_genres[gId]);
      }
    }
    //Stream based code
    //_dataRepository.bookGenresStream(id: bkId).forEach((gId) => bookGenres.add(_genres[gId]));
    return memberGenres;
  }
}
