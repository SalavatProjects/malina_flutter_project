import 'package:malina_flutter_project/features/auth/data/datasources/user_local_data_source.dart';
import 'package:malina_flutter_project/features/shared/data/mappers/user_mapper.dart';
import 'package:malina_flutter_project/features/shared/data/models/cart_item_model.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';
import 'package:malina_flutter_project/features/cart/domain/repositories/cart_repository.dart';
import 'package:malina_flutter_project/features/shared/data/models/user_model.dart';

class CartRepositoryImpl implements CartRepository{
  final UserLocalDataSource local;

  CartRepositoryImpl(this.local);

  Future<void> _saveCartItems(List<CartItemModel> items) async {
    final UserModel? user = await local.getCurrentUser();
    if (user == null) return;

    final UserModel updatedUser = user.copyWith(cartItems: items);
    await local.updateUser(updatedUser);
  }

  @override
  Future<List<CartItemEntity>> getCurrentUserCart() async {
    final UserModel? user = await local.getCurrentUser();
    if (user == null) return [];

    return user.toEntity().cartItems;
  }

  @override
  Future<void> addToCart({required int productId}) async {
    final UserModel? user = await local.getCurrentUser();
    if (user == null) return;

    final List<CartItemModel> items = List.from(user.cartItems);
    final int index = items.indexWhere((e) => e.productId == productId);

    if (index == -1) {
      items.add(CartItemModel(productId: productId, quantity: 1));
    } else {
      final existing = items[index];
      items[index] = existing.copyWith(quantity: existing.quantity + 1);
    }

    await _saveCartItems(items);
  }

  @override
  Future<void> increaseItem({required int productId}) async {
    await addToCart(productId: productId);
  }

  @override
  Future<void> decreaseItem({required int productId}) async {
    final UserModel? user = await local.getCurrentUser();
    if (user == null) return;

    final List<CartItemModel> items = List.from(user.cartItems);
    final int index = items.indexWhere((i) => i.productId == productId);

    if (index == -1) return;

    final CartItemModel item = items[index];

    if (item.quantity <= 1) {
      items.removeAt(index);
    } else {
      items[index] = item.copyWith(quantity: item.quantity - 1);
    }

    await _saveCartItems(items);
  }

  @override
  Future<void> removeItem({required int productId}) async {
    final UserModel? user = await local.getCurrentUser();
    if (user == null) return;

    final List<CartItemModel> items = List.from(user.cartItems)..removeWhere((e) => e.productId == productId);

    await _saveCartItems(items);
  }

  @override
  Future<void> clearCart() async {
    await _saveCartItems([]);
  }

}