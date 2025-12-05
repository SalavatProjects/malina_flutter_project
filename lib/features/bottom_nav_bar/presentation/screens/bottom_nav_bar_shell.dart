import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/bottom_nav_bar/presentation/widgets/cart_content.dart';
import 'package:malina_flutter_project/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import 'package:malina_flutter_project/gen/assets.gen.dart';

import '../widgets/custom_nav_bar.dart';
import '../widgets/nav_bar_item.dart';
import '../widgets/nav_bar_scan_button.dart';

class BottomNavBarShell extends StatefulWidget {
  final Widget child;

  const BottomNavBarShell({super.key, required this.child});

  @override
  State<BottomNavBarShell> createState() => _BottomNavBarShellState();
}

class _BottomNavBarShellState extends State<BottomNavBarShell> {
  bool _isCartContentOpen = false;

  int _getCurrentIndex(String location) {
    if (location.startsWith(AppRoutes.feed.path)) return 0;
    if (location.startsWith(AppRoutes.favorites.path)) return 1;
    if (location.startsWith(AppRoutes.profile.path)) return 3;
    if (location.startsWith(AppRoutes.cart.path)) return 4;

    return -1;
  }

  void _pushToCart({required BuildContext context ,required ProductCategory category}) {
    setState(() {
      _isCartContentOpen = false;
    });
    context.pushNamed(AppRoutes.cart.name, extra: category.name);
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _getCurrentIndex(
      GoRouterState.of(context).uri.toString(),
    );
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavBar(
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
                NavBarScanButton(onPressed: () async {
                  if (currentIndex != 0) {
                    appRouter.goNamed(AppRoutes.feed.name);
                  } else {
                    final result = await appRouter.pushNamed(AppRoutes.qrScanPage.name);

                    if (result is ProductEntity) {
                      context.read<CartCubit>().addProduct(result);
                    }
                  }
                }, isToBack: currentIndex != 0),
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
                  onPressed: () {
                    setState(() {
                      _isCartContentOpen = !_isCartContentOpen;
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.w,
            bottom: 60.w,
            child: CartContent(
                isOpen: _isCartContentOpen,
                onFoodPressed: () {
                  _pushToCart(context: context, category: ProductCategory.food);
                },
                onBeautyPressed: () {
                  _pushToCart(context: context, category: ProductCategory.beauty);
                }),
          )
        ],
      ),
    );
  }
}
