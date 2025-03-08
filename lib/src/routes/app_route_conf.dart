import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/data/models/message_page_extra.dart';
import '../features/home/presentation/pages/messages.dart';
import '../features/home/presentation/screens/home.dart';
import 'app_route_path.dart';

class AppRouteConf {
  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: AppRoute.chats.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoute.chats.path,
        name: AppRoute.chats.name,
        builder: (_, __) => const HomeScreen(),
        routes: [
          GoRoute(
            path: AppRoute.messages.path,
            name: AppRoute.messages.name,
            builder: (_, state) {
              final data = MessagePageExtraModel.fromJson(
                  json.decode(state.extra as String));
              return MessagesPage(data: data);
            },
          ),
        ],
      ),
    ],
  );

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(key: state.pageKey, child: child);
  }
}
