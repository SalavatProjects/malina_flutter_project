import 'package:flutter/material.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';

class CartScreen extends StatefulWidget {
  final ProductCategory initialCategory;

  const CartScreen({
    super.key,
    required this.initialCategory,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductCategory _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('cart screen'),
      ),
    );
  }
}
