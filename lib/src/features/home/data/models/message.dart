import 'dart:io';

import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final int id;
  final int authorId;
  final int createdAt;
  final String text;
  final File? image;
  final bool isRead;

  const MessageModel({
    required this.id,
    required this.authorId,
    required this.createdAt,
    required this.text,
    this.image,
    required this.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      authorId: json['authorId'],
      createdAt: json['createdAt'],
      text: json['text'],
      image: json['image'],
      isRead: json['isRead'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorId': authorId,
      'createdAt': createdAt,
      'text': text,
      'image': image,
      'isRead': isRead,
    };
  }

  @override
  List<Object?> get props => [id, authorId, createdAt, text, image, isRead];
}
