import 'dart:convert';

class MemberAuthorReview {
  final String text;
  final int rating;
  final DateTime date;
  final int mId;
  final int bkId;
  final String bkName;
  final String bkRating;
  final String bkImageUrl;
  MemberAuthorReview({
    required this.text,
    required this.rating,
    required this.date,
    required this.mId,
    required this.bkId,
    required this.bkName,
    required this.bkRating,
    required this.bkImageUrl,
  });

  MemberAuthorReview copyWith({
    String? text,
    int? rating,
    DateTime? date,
    int? mId,
    int? bkId,
    String? bkName,
    String? bkRating,
    String? bkImageUrl,
  }) {
    return MemberAuthorReview(
      text: text ?? this.text,
      rating: rating ?? this.rating,
      date: date ?? this.date,
      mId: mId ?? this.mId,
      bkId: bkId ?? this.bkId,
      bkName: bkName ?? this.bkName,
      bkRating: bkRating ?? this.bkRating,
      bkImageUrl: bkImageUrl ?? this.bkImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'rating': rating,
      'date': date.millisecondsSinceEpoch,
      'mId': mId,
      'bkId': bkId,
      'bkName': bkName,
      'bkRating': bkRating,
      'bkImageUrl': bkImageUrl,
    };
  }

  factory MemberAuthorReview.fromMap(Map<String, dynamic> map) {
    return MemberAuthorReview(
      text: map['text'] as String,
      rating: map['rating'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      mId: map['mId'] as int,
      bkId: map['bkId'] as int,
      bkName: map['bkName'] as String,
      bkRating: map['bkRating'] as String,
      bkImageUrl: map['bkImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberAuthorReview.fromJson(String source) =>
      MemberAuthorReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MemberAuthorReview(text: $text, rating: $rating, date: $date, mId: $mId, bkId: $bkId, bkName: $bkName, bkRating: $bkRating, bkImageUrl: $bkImageUrl)';
  }

  @override
  bool operator ==(covariant MemberAuthorReview other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.rating == rating &&
        other.date == date &&
        other.mId == mId &&
        other.bkId == bkId &&
        other.bkName == bkName &&
        other.bkRating == bkRating &&
        other.bkImageUrl == bkImageUrl;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        rating.hashCode ^
        date.hashCode ^
        mId.hashCode ^
        bkId.hashCode ^
        bkName.hashCode ^
        bkRating.hashCode ^
        bkImageUrl.hashCode;
  }
}
