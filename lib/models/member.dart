// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Member {
  int id;
  String firstName;
  String lastName;
  String bio;
  DateTime startDate;
  int age;
  String imageUrl;
  String email;
  String password;
  Member({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.startDate,
    required this.age,
    required this.imageUrl,
    required this.email,
    required this.password,
  });

  Member copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? bio,
    DateTime? startDate,
    int? age,
    String? imageUrl,
    String? email,
    String? password,
  }) {
    return Member(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      startDate: startDate ?? this.startDate,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'bio': bio,
      'startDate': startDate.millisecondsSinceEpoch,
      'age': age,
      'imageUrl': imageUrl,
      'email': email,
      'password': password,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      bio: map['bio'] as String,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      age: map['age'] as int,
      imageUrl: map['imageUrl'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) =>
      Member.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Member(id: $id, firstName: $firstName, lastName: $lastName, bio: $bio, startDate: $startDate, age: $age, imageUrl: $imageUrl, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant Member other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.bio == bio &&
        other.startDate == startDate &&
        other.age == age &&
        other.imageUrl == imageUrl &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        bio.hashCode ^
        startDate.hashCode ^
        age.hashCode ^
        imageUrl.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
