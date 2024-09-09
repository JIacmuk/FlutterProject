import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flop/presentation/presentation.dart';
import 'package:flop/di/dependencyInjection.dart';

final GlobalKey<NavigatorState> _rootNavigationKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  observers: [TalkerRouteObserver(talker)],
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
      // для следующей лабораторной работы
      // routes: [
      // GoRoute(
      // path: 'article/:id',
      // pageBuilder: (context, state) {
      // return NoTransitionPage<void>(
      // key: state.pageKey,
      // child: const ArticleScreen(),
      // );
      // },
      // ),
      // ],
    ),
  ],
);