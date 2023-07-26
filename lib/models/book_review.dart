// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookReview {
  final String text;
  final int rating;
  final DateTime date;
  final int bookId;
  final int mId;
  final String mFirstName;
  final String mLastName;
  final String mImageUrl;
  BookReview({
    required this.text,
    required this.rating,
    required this.date,
    required this.bookId,
    required this.mId,
    required this.mFirstName,
    required this.mLastName,
    required this.mImageUrl,
  });

  BookReview copyWith({
    String? text,
    int? rating,
    DateTime? date,
    int? bookId,
    int? mId,
    String? mFirstName,
    String? mLastName,
    String? mImageUrl,
  }) {
    return BookReview(
      text: text ?? this.text,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      bookId: bookId ?? this.bookId,
      mId: mId ?? this.mId,
      mFirstName: mFirstName ?? this.mFirstName,
      mLastName: mLastName ?? this.mLastName,
      mImageUrl: mImageUrl ?? this.mImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'rating': rating,
      'date': date.millisecondsSinceEpoch,
      'bookId': bookId,
      'mId': mId,
      'mFirstName': mFirstName,
      'mLastName': mLastName,
      'mImageUrl': mImageUrl,
    };
  }

  factory BookReview.fromMap(Map<String, dynamic> map) {
    return BookReview(
      text: map['text'] as String,
      rating: map['rating'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      bookId: map['bookId'] as int,
      mId: map['mId'] as int,
      mFirstName: map['mFirstName'] as String,
      mLastName: map['mLastName'] as String,
      mImageUrl: map['mImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookReview.fromJson(String source) =>
      BookReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookReview(text: $text, rating: $rating, date: $date, bookId: $bookId, mId: $mId, mFirstName: $mFirstName, mLastName: $mLastName, mImageUrl: $mImageUrl)';
  }

  @override
  bool operator ==(covariant BookReview other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.rating == rating &&
        other.date == date &&
        other.bookId == bookId &&
        other.mId == mId &&
        other.mFirstName == mFirstName &&
        other.mLastName == mLastName &&
        other.mImageUrl == mImageUrl;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        rating.hashCode ^
        date.hashCode ^
        bookId.hashCode ^
        mId.hashCode ^
        mFirstName.hashCode ^
        mLastName.hashCode ^
        mImageUrl.hashCode;
  }
}
