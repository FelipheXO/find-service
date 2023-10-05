import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  String? id;
  String? name;
  String? email;
  String? city;
  String? state;
  String? code;
  String? number;
  String? title;
  String? des;
  String? value;
  String? userId;
  int? createdAt;

  Services(
      {this.name,
      this.email,
      this.id,
      this.title,
      this.des,
      this.value,
      this.city,
      this.createdAt,
      this.userId,
      this.state,
      this.number,
      this.code});

  factory Services.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> json, String? documentId) {
    return Services(
      id: documentId,
      title: json['title'],
      des: json['des'],
      value: json['value'],
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      city: json['city'],
      state: json['state'],
      createdAt: json['createdAt'],
      code: json['code'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['des'] = des;
    data['value'] = value;
    data['userId'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['city'] = city;
    data['state'] = state;
    data['code'] = code;
    data['number'] = number;
    return data;
  }
}
