import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import 'package:malina_flutter_project/gen/assets.gen.dart';

import '../widgets/custom_nav_bar.dart';
import '../widgets/nav_bar_item.dart';
import '../widgets/nav_bar_scan_button.dart';

class BottomNavBarShell extends StatelessWidget {
  final Widget child;

  const BottomNavBarShell({super.key, required this.child});

  int _getCurrentIndex(String location) {
    if (location.startsWith(AppRoutes.feed.path)) return 0;
    if (location.startsWith(AppRoutes.favorites.path)) return 1;
    if (location.startsWith(AppRoutes.profile.path)) return 3;
    if (location.startsWith(AppRoutes.cart.path)) return 4;

    return -1;
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _getCurrentIndex(
      GoRouterState.of(context).matchedLocation,
    );
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavBar(
        items: [
          NavBarItem(
            index: 0,
            iconPath: Assets.icons.feed.path,
            text: t.bottomNavBarContent.feed.toCapitalize(),
            isActive: currentIndex == 0,
            onPressed: () {
              appRouter.goNamed(AppRoutes.feed.name);
            },
          ),
          NavBarItem(
            index: 1,
            iconPath: Assets.icons.heart.path,
            text: t.bottomNavBarContent.favorites.toCapitalize(),
            isActive: currentIndex == 1,
            onPressed: () {
              appRouter.goNamed(AppRoutes.favorites.name);
            },
          ),
          NavBarScanButton(onPressed: () {}, isToBack: currentIndex != 0),
          NavBarItem(
            index: 3,
            iconPath: Assets.icons.profile.path,
            text: t.bottomNavBarContent.profile.toCapitalize(),
            isActive: currentIndex == 3,
            onPressed: () {
              appRouter.goNamed(AppRoutes.profile.name);
            },
          ),
          NavBarItem(
            index: 4,
            iconPath: Assets.icons.cart.path,
            text: t.bottomNavBarContent.cart.toCapitalize(),
            isActive: currentIndex == 4,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
