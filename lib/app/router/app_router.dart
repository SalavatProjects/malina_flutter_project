import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  // auth
  login,
  register,

  app,
  // app routes
  feed,
  profile,
  cart;

  String get path => "/$name";
  String get appPath => '/${AppRoutes.app.name}/$name';
}

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
    routes: [],);