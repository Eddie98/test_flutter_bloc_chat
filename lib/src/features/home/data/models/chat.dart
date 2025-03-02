import 'package:equatable/equatable.dart';

import 'message.dart';
import 'user.dart';

class ChatResponseModel extends Equatable {
  final int? page;
  final int? pageSize;
  final int? totalAmount;
  final List<ChatModel>? data;

  const ChatResponseModel({
    this.page,
    this.pageSize,
    this.totalAmount,
    this.data,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      page: json['page'],
      pageSize: json['pageSize'],
      totalAmount: json['totalAmount'],
      data: json['data'] != null ? List<ChatModel>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'pageSize': pageSize,
      'totalAmount': totalAmount,
      'data': data,
    };
  }

  @override
  List<Object?> get props => [
        page,
        pageSize,
        totalAmount,
        data,
      ];
}

class ChatModel extends Equatable {
  final int id;
  final List<UserModel> users;
  final List<MessageModel> messages;

  const ChatModel({
    required this.id,
    required this.users,
    required this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'],
      users: List<UserModel>.from(json['users']),
      messages: List<MessageModel>.from(json['messages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'users': users,
      'messages': messages,
    };
  }

  @override
  List<Object?> get props => [id, users, messages];
}
