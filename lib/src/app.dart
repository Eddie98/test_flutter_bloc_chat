import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter_bloc_chat/src/features/home/presentation/bloc/home/home_bloc.dart';

import 'configs/injector/injector_conf.dart';
import 'core/blocs/theme/theme_bloc.dart';
import 'core/blocs/translate/translate_bloc.dart';
import 'core/themes/app_theme.dart';
import 'routes/app_route_conf.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouteConf>().router;

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => getIt<ThemeBloc>()..add(LightThemeEvent())),
            BlocProvider(create: (_) => getIt<TranslateBloc>()),
            BlocProvider(
                create: (_) => getIt<HomeBloc>()..add(GetChatsEvent())),
          ],
          child: Builder(builder: (context) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: context.read<ThemeBloc>().state.isDarkMode
                    ? Colors.black
                    : Colors.white,
              ),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (_, state) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    theme: AppTheme.data(state.isDarkMode),
                    routerConfig: router,
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
