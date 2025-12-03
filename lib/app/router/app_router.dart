import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/app/di/di.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_state.dart';
import 'package:malina_flutter_project/features/auth/presentation/screens/login_screen.dart';
import 'package:malina_flutter_project/features/auth/presentation/screens/register_screen.dart';
import 'package:malina_flutter_project/features/bottom_nav_bar/presentation/screens/bottom_nav_bar_shell.dart';
import 'package:malina_flutter_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:malina_flutter_project/features/feed/presentation/screens/feed_screen.dart';
import 'package:malina_flutter_project/features/profile/presentation/screens/profile_screen.dart';

enum AppRoutes {
  // auth
  login("/login"),
  register("/register"),

  home("/home"), // bottom_nav_bar,
  // app routes
  feed("/home/feed"),
  favorites("/home/favorites"),
  profile("/home/profile"),
  cart("/home/cart"),

  qrScanPage("/qrScanPage");

  final String path;
  const AppRoutes(this.path);

  // String get path => "/$name";
  // String get appPath => '/${AppRoutes.app.name}/$name';
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: AppRoutes.login.path,

  redirect: (context, state) {
    final AuthState auth = getIt<AuthCubit>().state;
    if (auth is AuthLoading) return null;

    if (auth is AuthLoggedOut &&
        state.matchedLocation != AppRoutes.login.path &&
            state.matchedLocation != AppRoutes.register.path) {
      print('hi123');
      return AppRoutes.login.path;
    }

    if (auth is AuthSuccess &&
        (state.matchedLocation == AppRoutes.login.path ||
            state.matchedLocation == AppRoutes.register.path)) {
      return AppRoutes.feed.path;
    }

    return null;
  },

  routes: [
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register.path,
      name: AppRoutes.register.name,
      builder: (context, state) => const RegisterScreen(),
    ),

    ShellRoute(
      builder: (context, state, child) => BottomNavBarShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.feed.path,
          name: AppRoutes.feed.name,
          builder: (context, state) => const FeedScreen(),
        ),
        GoRoute(
          path: AppRoutes.favorites.path,
          name: AppRoutes.favorites.name,
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: AppRoutes.profile.path,
          name: AppRoutes.profile.name,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: AppRoutes.cart.path,
          name: AppRoutes.cart.name,
          builder: (context, state) => const CartScreen(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.qrScanPage.path,
      name: AppRoutes.qrScanPage.name,
      builder: (context, state) => const Placeholder(),
    ),
  ],
);
