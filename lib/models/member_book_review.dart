// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MemberBookReview {
  final String text;
  final int rating;
  final DateTime date;
  final int mId;
  final int aId;
  final String aFirstName;
  final String aLastName;
  final String aImageUrl;
  MemberBookReview({
    required this.text,
    required this.rating,
    required this.date,
    required this.mId,
    required this.aId,
    required this.aFirstName,
    required this.aLastName,
    required this.aImageUrl,
  });

  MemberBookReview copyWith({
    String? text,
    int? rating,
    DateTime? date,
    int? mId,
    int? aId,
    String? aFirstName,
    String? aLastName,
    String? aImageUrl,
  }) {
    return MemberBookReview(
      text: text ?? this.text,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      mId: mId ?? this.mId,
      aId: aId ?? this.aId,
      aFirstName: aFirstName ?? this.aFirstName,
      aLastName: aLastName ?? this.aLastName,
      aImageUrl: aImageUrl ?? this.aImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'rating': rating,
      'date': date.millisecondsSinceEpoch,
      'mId': mId,
      'aId': aId,
      'aFirstName': aFirstName,
      'aLastName': aLastName,
      'aImageUrl': aImageUrl,
    };
  }

  factory MemberBookReview.fromMap(Map<String, dynamic> map) {
    return MemberBookReview(
      text: map['text'] as String,
      rating: map['rating'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      mId: map['mId'] as int,
      aId: map['aId'] as int,
      aFirstName: map['aFirstName'] as String,
      aLastName: map['aLastName'] as String,
      aImageUrl: map['aImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberBookReview.fromJson(String source) =>
      MemberBookReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MemberBookReview(text: $text, rating: $rating, date: $date, mId: $mId, aId: $aId, aFirstName: $aFirstName, aLastName: $aLastName, aImageUrl: $aImageUrl)';
  }

  @override
  bool operator ==(covariant MemberBookReview other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.rating == rating &&
        other.date == date &&
        other.mId == mId &&
        other.aId == aId &&
        other.aFirstName == aFirstName &&
        other.aLastName == aLastName &&
        other.aImageUrl == aImageUrl;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        rating.hashCode ^
        date.hashCode ^
        mId.hashCode ^
        aId.hashCode ^
        aFirstName.hashCode ^
        aLastName.hashCode ^
        aImageUrl.hashCode;
  }
}
