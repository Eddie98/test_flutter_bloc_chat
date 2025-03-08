import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'src/app.dart';
import 'src/configs/adapter/adapter_conf.dart';
import 'src/configs/injector/injector_conf.dart';
import 'src/core/constants/list_translation_locale.dart';
import 'src/core/utils/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Future.wait([
    Hive.initFlutter(),
    getTemporaryDirectory().then((dir) async {
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorageDirectory(dir.path),
      );
    }),
  ]);

  configureAdapter();
  configureDepedencies();

  Bloc.observer = AppBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [englishLocale, russianLocale],
      path: 'assets/translations',
      startLocale: russianLocale,
      fallbackLocale: englishLocale,
      child: const MyApp(),
    ),
  );
}
