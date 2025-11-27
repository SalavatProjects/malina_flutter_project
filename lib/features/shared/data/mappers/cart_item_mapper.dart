import 'package:malina_flutter_project/features/shared/data/models/cart_item_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';

extension CartItemModelToEntity on CartItemModel {
  CartItemEntity toEntity() {
    return CartItemEntity(productId: productId, quantity: quantity);
  }
}

extension CartItemEntityToModel on CartItemEntity {
  CartItemModel toModel() {
    return CartItemModel(productId: productId, quantity: quantity);
  }
}
