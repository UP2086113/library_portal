// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:library_portal/utils/enums/book_issue_status_enum.dart';

import 'book_copy.dart';

class MemberBookIssue {
  final int issueId;
  final int mId;
  final BookCopy bookCopy;
  final DateTime issueDate;
  final DateTime dueDate;
  final BookIssueStatus? status;
  final DateTime? returnedDate;
  final String bookName;
  final String authorName;
  final String bookImageUrl;
  MemberBookIssue({
    required this.issueId,
    required this.mId,
    required this.bookCopy,
    required this.issueDate,
    required this.dueDate,
     this.status,
    this.returnedDate,
    required this.bookName,
    required this.authorName,
    required this.bookImageUrl,
  });

  MemberBookIssue copyWith({
    int? issueId,
    int? mId,
    BookCopy? bookCopy,
    DateTime? issueDate,
    DateTime? dueDate,
    BookIssueStatus? status,
    DateTime? returnedDate,
    String? bookName,
    String? authorName,
    String? bookImageUrl,
  }) {
    return MemberBookIssue(
      issueId: issueId ?? this.issueId,
      mId: mId ?? this.mId,
      bookCopy: bookCopy ?? this.bookCopy,
      issueDate: issueDate ?? this.issueDate,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      returnedDate: returnedDate ?? this.returnedDate,
      bookName: bookName ?? this.bookName,
      authorName: authorName ?? this.authorName,
      bookImageUrl: bookImageUrl ?? this.bookImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'issueId': issueId,
      'mId': mId,
      'bookCopy': bookCopy.toJson(),
      'issueDate': issueDate.millisecondsSinceEpoch,
      'dueDate': dueDate.millisecondsSinceEpoch,
      'status': status,
      'returnedDate': returnedDate?.millisecondsSinceEpoch,
      'bookName': bookName,
      'authorName': authorName,
      'bookImageUrl': bookImageUrl,
    };
  }

  factory MemberBookIssue.fromMap(Map<String, dynamic> map) {
    return MemberBookIssue(
      issueId: map['issueId'] as int,
      mId: map['mId'] as int,
      bookCopy: BookCopy.fromJson(map['bookCopy'] as Map<String, dynamic>),
      issueDate: DateTime.fromMillisecondsSinceEpoch(map['issueDate'] as int),
      dueDate: DateTime.fromMillisecondsSinceEpoch(map['dueDate'] as int),
      status: map['status'],
      returnedDate:
          DateTime.fromMillisecondsSinceEpoch(map['returnedDate'] as int),
      bookName: map['bookName'] as String,
      authorName: map['authorName'] as String,
      bookImageUrl: map['bookImageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberBookIssue.fromJson(String source) =>
      MemberBookIssue.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MemberBookIssue(issueId: $issueId, mId: $mId, bookCopy: $bookCopy, issueDate: $issueDate, dueDate: $dueDate, status: $status, returnedDate: $returnedDate, bookName: $bookName, authorName: $authorName, bookImageUrl: $bookImageUrl)';
  }

  @override
  bool operator ==(covariant MemberBookIssue other) {
    if (identical(this, other)) return true;

    return other.issueId == issueId &&
        other.mId == mId &&
        other.bookCopy == bookCopy &&
        other.issueDate == issueDate &&
        other.dueDate == dueDate &&
        other.status == status &&
        other.returnedDate == returnedDate &&
        other.bookName == bookName &&
        other.authorName == authorName &&
        other.bookImageUrl == bookImageUrl;
  }

  @override
  int get hashCode {
    return issueId.hashCode ^
        mId.hashCode ^
        bookCopy.hashCode ^
        issueDate.hashCode ^
        dueDate.hashCode ^
        status.hashCode ^
        returnedDate.hashCode ^
        bookName.hashCode ^
        authorName.hashCode ^
        bookImageUrl.hashCode;
  }
}
