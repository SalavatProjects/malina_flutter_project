import 'dart:math';

import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/core/services/id_generator.dart';
import 'package:malina_flutter_project/features/shared/data/models/product_model.dart';

import 'package:malina_flutter_project/gen/assets.gen.dart';

class ProductFromQrFactory {
  final _rnd = Random();


  Future<ProductModel> create(String qr) async {
    final productId = await IdGenerator.next(AppConstants.productsCollectionName);
    if (qr.startsWith(AppConstants.productFood)) {
      return ProductModel.food(
        id: productId.toString(),
        category: AppConstants.productFood,
        subcategory: "Снэки",
        name: "Чипсы картофельные",
        description: "Чипсы сделанный из картофеля",
        imagePath: Assets.images.pizzaImage.path,
        price: _randomPrice(),
      );
    } else if (qr.startsWith(AppConstants.productBeauty)) {
      return ProductModel.beauty(
        id: productId.toString(),
        subcategory: "Уход",
        name: "Крем для рук",
        description: "Этот крем предназначен для ухода за руками",
        imagePath: Assets.images.cosmeticImage.path,
        price: _randomPrice(),
      );
    } else {
      throw Exception("Unknown QR format");
    }
  }

  double _randomPrice() {
    return (50 + _rnd.nextInt(300)) + 0.99;
  }
}
