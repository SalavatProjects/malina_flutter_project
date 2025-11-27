import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCurrentUserCart();
  Future<void> addToCart({required int productId});
  Future<void> increaseItem({required int productId});
  Future<void> decreaseItem({required int productId});
  Future<void> removeItem({required int productId});
  Future<void> clearCart();
}