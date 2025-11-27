import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  // auth
  login("/login"),
  register("/register"),

  home("/home"), // bottom_nav_bar,
  // app routes
  feed("/home/feed"),
  favorites("/home/favorites"),
  profile("/home/profile"),
  cart("/home/profile"),

  qrScanPage("/qrScanPage");

  final String path;
  const AppRoutes(this.path);

  // String get path => "/$name";
  // String get appPath => '/${AppRoutes.app.name}/$name';
}

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
    routes: [],);