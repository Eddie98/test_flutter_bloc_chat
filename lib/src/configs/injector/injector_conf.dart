import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/api/api_helper.dart';
import '../../core/api/api_interceptor.dart';
import '../../core/blocs/theme/theme_bloc.dart';
import '../../core/cache/hive_local_storage.dart';
import '../../core/network/network_checker.dart';
import '../../features/home/di/home_dependency.dart';
import '../../routes/app_route_conf.dart';

final getIt = GetIt.I;

void configureDepedencies() {
  HomeDependency.init();

  getIt.registerLazySingleton(
    () => ThemeBloc(),
  );

  getIt.registerLazySingleton(
    () => AppRouteConf(),
  );

  getIt.registerLazySingleton(
    () => ApiHelper(getIt<Dio>()),
  );

  getIt.registerLazySingleton(
    () => Dio()
      ..interceptors.add(
        getIt<ApiInterceptor>(),
      ),
  );

  getIt.registerLazySingleton(
    () => ApiInterceptor(),
  );

  getIt.registerLazySingleton(
    () => HiveLocalStorage(),
  );

  getIt.registerLazySingleton(
    () => NetworkInfo(
      getIt<InternetConnectionChecker>(),
    ),
  );

  getIt.registerLazySingleton(
    () => InternetConnectionChecker.createInstance(),
  );
}
