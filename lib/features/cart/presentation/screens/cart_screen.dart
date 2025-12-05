import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/app/di/di.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/common/widgets/custom_app_bar.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:malina_flutter_project/features/cart/presentation/widgets/cart_category_button.dart';
import 'package:malina_flutter_project/features/cart/presentation/widgets/cart_product_card.dart';
import 'package:malina_flutter_project/features/product/domain/repositories/product_repository.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/features/shared/presentation/extension/product_category_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import 'package:malina_flutter_project/features/cart/presentation/bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  final ProductCategory initialCategory;

  const CartScreen({super.key, required this.initialCategory});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductCategory _selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCart();
    _selectedCategory = widget.initialCategory;
  }

  void _selectProductCategory(ProductCategory category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  Future<List<ProductEntity>> _getUserProducts(
    BuildContext context,
    List<CartItemEntity> items,
  ) async {
    final productRepository = getIt<ProductRepository>();

    final List<ProductEntity> result = [];

    for (final item in items) {
      final product = await productRepository.getProductById(
        item.productId.toString(),
      );
      if (product != null) {
        result.add(product);
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onActionPressed: () {
          context.read<CartCubit>().clear();
        },
        actionText: t.action.clear.toCapitalize(),
        title: t.cart.name.toCapitalize(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.w),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CartCategoryButton(
                            onPressed: () {
                              _selectProductCategory(ProductCategory.food);
                            },
                            isActive: ProductCategory.food == _selectedCategory,
                            text: t.feed.food.name.toCapitalize(),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: CartCategoryButton(
                            onPressed: () {
                              _selectProductCategory(ProductCategory.beauty);
                            },
                            isActive:
                                ProductCategory.beauty == _selectedCategory,
                            text: t.feed.beauty.name.toCapitalize(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 26.w),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () =>
                              const Center(child: CircularProgressIndicator()),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (items) {
                            return FutureBuilder(
                              future: _getUserProducts(context, items),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final List<ProductEntity> productsByCategory =
                                      snapshot.data!.where((e) => e.category == _selectedCategory,).toList();
                                  if (productsByCategory.isNotEmpty) {
                                    final List<String> subcategories =
                                        productsByCategory.map((e) => e.subcategory).toSet().toList();
                                    return Column(
                                      children: [
                                        Column(
                                          children: List.generate(
                                            subcategories.length, (int subcategoryIndex,) => Padding(
                                              padding: EdgeInsets.only(bottom: 16.w),
                                              child: CartProductCard(
                                                productsBySubcategory:
                                                    productsByCategory.where((e) => e.subcategory ==
                                                        subcategories[subcategoryIndex],).toList(),
                                                cartItems: items,
                                                onIncreasePressed:
                                                    (int productId) {
                                                      context.read<CartCubit>().increase(productId);
                                                    },
                                                onDecreasePressed:
                                                    (int productId) {
                                                  context.read<CartCubit>().decrease(productId);
                                                    },
                                                onRemovePressed:
                                                    (int productId) {
                                                  context.read<CartCubit>().remove(productId);
                                                    },
                                                onAdditivitiesPressed:
                                                    (int productId) {},
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 60.w,)
                                      ],
                                    );
                                  } else {
                                    return Center(
                                      child: Text(
                                        t.cart.noProductsByThisCategory(
                                          categoty: _selectedCategory.label
                                              .toCapitalize(),
                                        ),
                                        style: AppStyles.robotoW400AlmostBlack(
                                          AppFontSizes.sp16,
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            );
                          },
                          error: (message) => Center(
                            child: Text(
                              message,
                              style: AppStyles.robotoW400AlmostBlack(
                                AppFontSizes.sp16,
                              ).copyWith(color: AppColors.error),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const Alignment(1, 0.7),
                child: FloatingActionButton(
                  onPressed: () async {
                    final result = await appRouter.pushNamed(
                      AppRoutes.addProductToCart.name,
                    );
                    if (result is ProductEntity) {
                      context.read<CartCubit>().addProduct(result);
                    }
                  },
                  child: const Icon(Icons.add_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
