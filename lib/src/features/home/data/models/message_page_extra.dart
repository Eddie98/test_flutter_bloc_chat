import 'dart:convert';

import 'message.dart';
import 'user.dart';

class MessagePageExtraModel {
  final int index;
  final UserModel user;
  final bool isOnline;
  final List<MessageModel> messages;

  const MessagePageExtraModel({
    required this.index,
    required this.user,
    required this.isOnline,
    required this.messages,
  });

  factory MessagePageExtraModel.fromJson(Map<String, dynamic> json) {
    return MessagePageExtraModel(
      index: json['index'],
      user: UserModel.fromJson(json['user']),
      isOnline: json['isOnline'],
      messages: (json['messages'] as List).map((e) => MessageModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'user': user.toJson(),
      'isOnline': isOnline,
      'messages': messages.map((e) => e.toJson()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
