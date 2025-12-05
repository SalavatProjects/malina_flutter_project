import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/core/common/widgets/app_buttons.dart';
import 'package:malina_flutter_project/core/common/widgets/app_text_form_field.dart';
import 'package:malina_flutter_project/core/common/widgets/custom_app_bar.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/core/services/id_generator.dart';
import 'package:malina_flutter_project/core/utils/validators/empty_field_validator.dart';
import 'package:malina_flutter_project/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:malina_flutter_project/features/cart/presentation/widgets/cart_background_widget.dart';
import 'package:malina_flutter_project/features/cart/presentation/widgets/cart_product_description_text_field.dart';
import 'package:malina_flutter_project/features/cart/presentation/widgets/category_dropdown_menu.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _subcategoryTextEditingController = TextEditingController();
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _priceTextEditingController = TextEditingController();
  final TextEditingController _descriptionTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ProductCategory _selectedProductCategory = ProductCategory.food;

  @override
  void dispose() {
    super.dispose();
    _subcategoryTextEditingController.dispose();
    _nameTextEditingController.dispose();
    _priceTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        onActionPressed: () async {
          final result = await appRouter.pushNamed(AppRoutes.qrScanPage.name);
          if (result is ProductEntity) {
            context.read<CartCubit>().addProduct(result);
          }
        },
        actionText: t.action.scan.toCapitalize(),
        title: t.action.add.toCapitalize(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 20.w),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                const Positioned.fill(child: CartBackgroundWidget()),
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        CategoryDropdownMenu(
                            onCategoryChanged: (ProductCategory value) {
                              _selectedProductCategory = value;
                        }),
                        SizedBox(height: 24.w,),
                        AppTextFormField(
                            textEditingController: _subcategoryTextEditingController,
                            hintText: t.common.subcategory.toCapitalize(),
                            onTextChanged: (String value) {},
                          validator: (String? value) {
                              return EmptyFieldValidator.validate(value);
                          },
                        ),
                        SizedBox(height: 8.w,),
                        AppTextFormField(
                            textEditingController: _nameTextEditingController,
                            hintText: t.common.name.toCapitalize(),
                            onTextChanged: (String value) {},
                          validator: (String? value) {
                              return EmptyFieldValidator.validate(value);
                          },
                        ),
                        SizedBox(height: 8.w,),
                        AppTextFormField(
                            textEditingController: _priceTextEditingController,
                            keyboardType: const TextInputType.numberWithOptions(),
                            hintText: t.common.price.toCapitalize(),
                            onTextChanged: (String value) {

                            }),
                        SizedBox(height: 8.w,),
                        CartProductDescriptionTextField(
                            textEditingController: _descriptionTextEditingController,
                            validator: (String? value) {
                              return EmptyFieldValidator.validate(value);
                            },
                            onTextChanged: (String value) {},
                        ),
                        // const Spacer(),

                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.9),
                  child: AppPrimaryButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final int productId = await IdGenerator.next(AppConstants.productsCollectionName);
                          final ProductEntity entity = ProductEntity(
                              id: productId.toString(),
                              category: _selectedProductCategory,
                              subcategory: _subcategoryTextEditingController.text,
                              name: _nameTextEditingController.text,
                              description: _descriptionTextEditingController.text,
                              price: double.parse(_priceTextEditingController.text),
                          );

                          context.pop(entity);
                        }
                      }, text: t.action.save.toCapitalize()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
