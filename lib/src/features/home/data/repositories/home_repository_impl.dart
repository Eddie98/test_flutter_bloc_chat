import 'package:fpdart/fpdart.dart';
import 'package:test_flutter_bloc_chat/src/features/home/data/models/chat.dart';

import '../../../../core/cache/local_storage.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/usecase_params.dart';
import '../datasource/home_local_datasource.dart';
import '../datasource/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  // ignore: unused_field
  final HomeRemoteDataSource _remoteDataSource;
  // ignore: unused_field
  final HomeLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  // ignore: unused_field
  final LocalStorage _localStorage;

  const HomeRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
    this._localStorage,
  );

  @override
  Future<Either<Failure, ChatResponseModel>> getChats(
    GetChatsParams? params,
  ) {
    return _networkInfo.check<ChatResponseModel>(
      connected: () async {
        try {
          final items = await _localDataSource.getChats(params);
          return Right(items);
        } on ServerException {
          return Left(ServerFailure());
        }
      },
      notConnected: () async {
        try {
          return Right(ChatResponseModel());
        } on CacheException {
          return Left(CacheFailure());
        }
      },
    );
  }
}
