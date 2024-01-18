// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce/domain/entities/product.dart';

class User {
  Name? name;
  String username;
  String email;
  Address? address;
  String? phone;

  User({
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
  });

  User copyWith({
    Name? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name?.toMap(),
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? Name.fromMap(map['name'] as Map<String,dynamic>) : null,
      username: map['username'] as String,
      email: map['email'] as String,
      address: map['address'] != null ? Address.fromMap(map['address'] as Map<String,dynamic>) : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(name: $name, username: $username, email: $email, address: $address, phone: $phone)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode;
  }
}

class Name {
  String firstname;
  String lastname;
  Name({
    required this.firstname,
    required this.lastname,
  });

  Name copyWith({
    String? firstname,
    String? lastname,
  }) {
    return Name(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  factory Name.fromMap(Map<String, dynamic> map) {
    return Name(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Name.fromJson(String source) =>
      Name.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Name(firstname: $firstname, lastname: $lastname)';

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname && other.lastname == lastname;
  }

  @override
  int get hashCode => firstname.hashCode ^ lastname.hashCode;
}

class Address {
  String city;
  String street;
  int number;
  String zipcode;
  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Address copyWith({
    String? city,
    String? street,
    int? number,
    String? zipcode,
  }) {
    return Address(
      city: city ?? this.city,
      street: street ?? this.street,
      number: number ?? this.number,
      zipcode: zipcode ?? this.zipcode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      city: map['city'] as String,
      street: map['street'] as String,
      number: map['number'] as int,
      zipcode: map['zipcode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(city: $city, street: $street, number: $number, zipcode: $zipcode)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.street == street &&
        other.number == number &&
        other.zipcode == zipcode;
  }

  @override
  int get hashCode {
    return city.hashCode ^ street.hashCode ^ number.hashCode ^ zipcode.hashCode;
  }
}

class UserFavorites {
  List<Product> favorites = [];
  UserFavorites(
    this.favorites,
  );
  
}
