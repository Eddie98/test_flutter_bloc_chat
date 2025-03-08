import 'dart:math';

import 'package:test_flutter_bloc_chat/src/features/home/data/models/message.dart';

import '../../../../core/cache/local_storage.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/others.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/usecases/usecase_params.dart';
import '../models/chat.dart';
import '../models/user.dart';

final sampleMessages = [
  'Привет, как дела?',
  'Что нового?',
  'Встретимся завтра?',
  'Как прошел день?',
  'Отличная погода сегодня!',
  'Ты свободен на выходных?',
  'Посмотрел новый фильм?',
  'Давно не виделись!',
  'Нужна твоя помощь',
  'Увидимся позже'
];

List<MessageModel> generateMessages(List<int> users) {
  final random = Random();
  final now = DateTime.now();

  return List.generate(5, (i) {
    final timestamp = now
        .subtract(Duration(
          days: random.nextInt(7),
          hours: random.nextInt(24),
          minutes: random.nextInt(60),
        ))
        .millisecondsSinceEpoch;

    final hasImage = random.nextDouble() < 0.5;
    final text = sampleMessages[random.nextInt(sampleMessages.length)];

    return MessageModel(
      id: i,
      authorId: users[random.nextInt(users.length)],
      text: hasImage ? '' : text,
      createdAt: timestamp,
      image: hasImage ? mountainImage : null,
      isRead: random.nextBool(),
    );
  });
}

final users = [
  UserModel(
    id: 0,
    name: 'Виктор Власов',
    isOnline: true,
  ),
  UserModel(
    id: 1,
    name: 'Саша Алексеев',
    isOnline: false,
  ),
  UserModel(
    id: 2,
    name: 'Пётр Жаринов',
    isOnline: false,
  ),
  UserModel(
    id: 3,
    name: 'Алина Жукова',
    isOnline: true,
  ),
  UserModel(
    id: 4,
    name: 'Дональд Трамп',
    isOnline: true,
  ),
];

final meAndUser0 = users.where((e) => e.id == 0 || e.id == myId).toList();
final meAndUser1 = users.where((e) => e.id == 1 || e.id == myId).toList();
final meAndUser2 = users.where((e) => e.id == 2 || e.id == myId).toList();
final meAndUser3 = users.where((e) => e.id == 3 || e.id == myId).toList();

final _response = ChatResponseModel(
  page: 1,
  pageSize: 10,
  totalAmount: 21,
  data: [
    ChatModel(
      id: 0,
      users: meAndUser0,
      messages: generateMessages(meAndUser0.map((e) => e.id).toList()),
    ),
    ChatModel(
      id: 1,
      users: meAndUser1,
      messages: generateMessages(meAndUser1.map((e) => e.id).toList()),
    ),
    ChatModel(
      id: 2,
      users: meAndUser2,
      messages: generateMessages(meAndUser2.map((e) => e.id).toList()),
    ),
    ChatModel(
      id: 3,
      users: meAndUser3,
      messages: generateMessages(meAndUser3.map((e) => e.id).toList()),
    ),
  ],
);

sealed class HomeLocalDataSource {
  Future<ChatResponseModel> getChats(GetChatsParams? params);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  // ignore: unused_field
  final LocalStorage _localStorage;

  const HomeLocalDataSourceImpl(this._localStorage);

  @override
  Future<ChatResponseModel> getChats(GetChatsParams? params) async {
    try {
      return _response;
    } catch (e, s) {
      logger.e('getChats error log', error: e, stackTrace: s);
      throw CacheException();
    }
  }
}
