import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/feed/presentation/widgets/feed_product_banner.dart';
import 'package:malina_flutter_project/features/feed/presentation/widgets/scan_banner.dart';
import 'package:malina_flutter_project/features/feed/presentation/widgets/search_in_malina.dart';
import 'package:malina_flutter_project/features/feed/presentation/widgets/soon_in_malina_items.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import 'package:malina_flutter_project/gen/assets.gen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SearchInMalina(
                  textEditingController: _searchTextEditingController,
                  onChanged: (String value) {},
                ),
                SizedBox(height: 14.w,),
                const ScanBanner(),
                SizedBox(height: 20.w,),
                FeedProductBanner(
                    title: t.feed.food.name.toCapitalize(),
                    subtitle: t.feed.food.title,
                    imagePath: Assets.images.foodBanner.path,
                    backgroundColor: AppColors.yellowLight,
                ),
                SizedBox(height: 20.w,),
                FeedProductBanner(
                    title: t.feed.beauty.name.toCapitalize(),
                    subtitle: t.feed.beauty.title,
                    imagePath: Assets.images.beautyBanner.path,
                    backgroundColor: AppColors.pinkLight,
                ),
                SizedBox(height: 30.w,),
                SoonInMalinaItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
