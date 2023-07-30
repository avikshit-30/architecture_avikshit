import 'package:architecture_avikshit/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/homepage/home_screen.dart';
import '../features/lastpage/last_screen.dart';
import '../features/listPage/presentation/UI/list_screen.dart';

import '../features/login screen/loginscreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: "/login",
      name: "login",
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: Duration(milliseconds: 500),
        child: LoginScreen(),
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>FadeTransition(opacity: animation, child: child,)
      ),
    ),
    GoRoute(
      path: "/home",
      name: 'home',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        transitionDuration: Duration(seconds: 1),
          child: HomeScreen(),
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>SlideTransition(position: Tween<Offset>(begin: const Offset(-1, 00),end: const Offset(0, 0)).animate(animation),
          child: child,)
      ),
      routes: [
        GoRoute(
          path: "listScreen",
          name: 'list',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
              transitionDuration: Duration(seconds: 1),
              child: ListScreen(),
              key: state.pageKey,
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>FadeTransition(opacity: animation, child: child,)
          ),
          routes: [
            GoRoute(
                path: 'lastScreen',
                name: "last",
                builder: (context, state) {
                  return const LastScreen();
                }),
          ],
        ),
      ],
    )
  ],
);
