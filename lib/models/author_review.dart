// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthorReview {
  final String text;
  final int rating;
  final DateTime date;
  final int aId;
  final int mId;
  final String mFirstName;
  final String mLastName;
  final String mImageUrl;
  AuthorReview({
    required this.text,
    required this.rating,
    required this.date,
    required this.aId,
    required this.mId,
    required this.mFirstName,
    required this.mLastName,
    required this.mImageUrl,
  });

  AuthorReview copyWith({
    String? text,
    int? rating,
    DateTime? date,
    int? aId,
    int? mId,
    String? mFirstName,
    String? mLastName,
    String? mImageUrl,
  }) {
    return AuthorReview(
      text: text ?? this.text,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      aId: aId ?? this.aId,
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
      'aId': aId,
      'mId': mId,
      'mFirstName': mFirstName,
      'mLastName': mLastName,
      'mImageUrl': mImageUrl,
    };
  }

  factory AuthorReview.fromMap(Map<String, dynamic> map) {
    return AuthorReview(
      text: map['text'] as String,
      rating: map['rating'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      aId: map['aId'] as int,
      mId: map['mId'] as int,
      mFirstName: map['mFirstName'] as String,
      mLastName: map['mLastName'] as String,
      mImageUrl: map['mImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorReview.fromJson(String source) =>
      AuthorReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthorReview(text: $text, rating: $rating, date: $date, aId: $aId, mId: $mId, mFirstName: $mFirstName, mLastName: $mLastName, mImageUrl: $mImageUrl)';
  }

  @override
  bool operator ==(covariant AuthorReview other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.rating == rating &&
        other.date == date &&
        other.aId == aId &&
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
        aId.hashCode ^
        mId.hashCode ^
        mFirstName.hashCode ^
        mLastName.hashCode ^
        mImageUrl.hashCode;
  }
}
