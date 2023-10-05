import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String? id;
  String? name;
  String? email;
  String? password;
  String? city;
  String? state;
  String? code;
  String? number;

  Users(
      {this.name,
      this.email,
      this.id,
      this.password,
      this.city,
      this.state,
      this.number,
      this.code});

  factory Users.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> json, String? documentId) {
    return Users(
      id: documentId,
      name: json['name'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      code: json['code'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['city'] = city;
    data['state'] = state;
    data['code'] = code;
    data['number'] = number;
    return data;
  }
}
