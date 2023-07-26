import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Book {
  final int id;
  final int authorId;
  final List<int> genreId;
  final String name;
  final int rating;
  final String bio;
  final String imageUrl;
  final DateTime publishedDate;
  Book({
    required this.id,
    required this.authorId,
    required this.genreId,
    required this.name,
    required this.rating,
    required this.bio,
    required this.imageUrl,
    required this.publishedDate,
  });

  Book copyWith({
    int? id,
    int? authorId,
    List<int>? genreId,
    String? name,
    int? rating,
    String? bio,
    String? imageUrl,
    DateTime? publishedDate,
  }) {
    return Book(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      genreId: genreId ?? this.genreId,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      bio: bio ?? this.bio,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'authorId': authorId,
      'genreId': genreId,
      'name': name,
      'rating': rating,
      'bio': bio,
      'imageUrl': imageUrl,
      'publishedDate': publishedDate.millisecondsSinceEpoch,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      authorId: map['authorId'] as int,
      genreId: List<int>.from((map['genreId'] as List<int>)),
      name: map['name'] as String,
      rating: map['rating'] as int,
      bio: map['bio'] as String,
      imageUrl: map['imageUrl'] as String,
      publishedDate:
          DateTime.fromMillisecondsSinceEpoch(map['publishedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, authorId: $authorId, genreId: $genreId, name: $name, rating: $rating, bio: $bio, imageUrl: $imageUrl, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.authorId == authorId &&
        listEquals(other.genreId, genreId) &&
        other.name == name &&
        other.rating == rating &&
        other.bio == bio &&
        other.imageUrl == imageUrl &&
        other.publishedDate == publishedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        authorId.hashCode ^
        genreId.hashCode ^
        name.hashCode ^
        rating.hashCode ^
        bio.hashCode ^
        imageUrl.hashCode ^
        publishedDate.hashCode;
  }
}
