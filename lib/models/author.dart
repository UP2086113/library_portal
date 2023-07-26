// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Author {
  int id;
  int age;
  int rating;
  String firstName;
  String lastName;
  String country;
  String imageUrl;
  Author({
    required this.id,
    required this.age,
    required this.rating,
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.imageUrl,
  });

  

  Author copyWith({
    int? id,
    int? age,
    int? rating,
    String? firstName,
    String? lastName,
    String? country,
    String? imageUrl,
  }) {
    return Author(
      id: id ?? this.id,
      age: age ?? this.age,
      rating: rating ?? this.rating,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      country: country ?? this.country,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'age': age,
      'rating': rating,
      'firstName': firstName,
      'lastName': lastName,
      'country': country,
      'imageUrl': imageUrl,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      id: map['id'] as int,
      age: map['age'] as int,
      rating: map['rating'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      country: map['country'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Author(id: $id, age: $age, rating: $rating, firstName: $firstName, lastName: $lastName, country: $country, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Author other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.age == age &&
      other.rating == rating &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.country == country &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      age.hashCode ^
      rating.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      country.hashCode ^
      imageUrl.hashCode;
  }
}
