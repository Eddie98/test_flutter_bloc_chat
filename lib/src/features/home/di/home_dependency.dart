

import 'package:test_flutter_bloc_chat/src/features/home/domain/usecases/get_chats_usecase.dart';

import '../../../configs/injector/injector_conf.dart';
import '../../../core/api/api_helper.dart';
import '../../../core/cache/hive_local_storage.dart';
import '../../../core/network/network_checker.dart';
import '../data/datasource/home_local_datasource.dart';
import '../data/datasource/home_remote_datasource.dart';
import '../data/repositories/home_repository_impl.dart';
import '../presentation/bloc/home/home_bloc.dart';

class HomeDependency {
  HomeDependency._();

  static void init() {
    getIt.registerLazySingleton(
      () => HomeBloc(
        getIt<GetChatsUseCase>(),
      ),
    );

    getIt.registerLazySingleton(
      () => HomeRepositoryImpl(
        getIt<HomeRemoteDataSourceImpl>(),
        getIt<HomeLocalDataSourceImpl>(),
        getIt<NetworkInfo>(),
        getIt<HiveLocalStorage>(),
      ),
    );

    getIt.registerLazySingleton(
      () => HomeRemoteDataSourceImpl(
        getIt<ApiHelper>(),
      ),
    );

    getIt.registerLazySingleton(
      () => HomeLocalDataSourceImpl(
        getIt<HiveLocalStorage>(),
      ),
    );

    getIt.registerLazySingleton(
      () => GetChatsUseCase(
        getIt<HomeRepositoryImpl>(),
      ),
    );
  }
}
