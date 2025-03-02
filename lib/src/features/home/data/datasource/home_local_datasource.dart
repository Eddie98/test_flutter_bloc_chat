import '../../../../core/cache/local_storage.dart';
import '../../../../core/constants/others.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/usecases/usecase_params.dart';
import '../models/chat.dart';
import '../models/user.dart';

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

final _response = ChatResponseModel(
  page: 1,
  pageSize: 10,
  totalAmount: 21,
  data: [
    ChatModel(
      id: 0,
      users: users.where((e) => e.id == 0 || e.id == myId).toList(),
      messages: [],
    ),
    ChatModel(
      id: 1,
      users: users.where((e) => e.id == 1 || e.id == myId).toList(),
      messages: [],
    ),
    ChatModel(
      id: 1,
      users: users.where((e) => e.id == 2 || e.id == myId).toList(),
      messages: [],
    ),
    ChatModel(
      id: 1,
      users: users.where((e) => e.id == 3 || e.id == myId).toList(),
      messages: [],
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
