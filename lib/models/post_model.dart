// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String email;
  final String title;
  final String description;
  final String photoUrl;
  final String name;
  final Timestamp date;
  final String uid;
  PostModel({
    required this.email,
    required this.date,
    required this.title,
    required this.description,
    required this.photoUrl,
    required this.name,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'date': date,
      'title': title,
      'description': description,
      'photoUrl': photoUrl,
      'name': name,
      'uid': uid,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      email: map['email'] as String,
      date: map['date'] as Timestamp,
      title: map['title'] as String,
      description: map['description'] as String,
      photoUrl: map['photoUrl'] as String,
      name: map['name'] as String,
      uid: map['uid'] as String,
    );
  }

  PostModel.fromJson(Map<String, Object?> json)
      : this(
          email: json['email'] as String,
          date: json['date'] as Timestamp,
          title: json['title'] as String,
          description: json['description'] as String,
          photoUrl: json['photoUrl'] as String,
          name: json['name'] as String,
          uid: json['uid'] as String,
        );

  Map<String, Object?> toJson() => {
        'email': email,
        'date': date,
        'title': title,
        'description': description,
        'photoUrl': photoUrl,
        'name': name,
        'uid': uid,
      };
}
