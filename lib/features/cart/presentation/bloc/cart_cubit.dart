import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:malina_flutter_project/features/cart/domain/repositories/cart_repository.dart';
import 'package:malina_flutter_project/features/product/domain/repositories/product_repository.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;
  final ProductRepository productRepository;

  CartCubit(
      this.cartRepository,
      this.productRepository,
      ) : super(const CartState.initial());

  Timer? _debounceTimer;

  Future<void> addProduct(ProductEntity product) async {
    if (state is! CartLoaded) return;

    await productRepository.addProduct(product);

    final current = (state as CartLoaded).items;
    final updated = _increaseLocal(current, int.parse(product.id));

    emit(CartState.loaded(updated));

    _debounceSave(() => cartRepository.addToCart(productId: int.parse(product.id)));
  }

  Future<void> increase(int productId) async {
    if (state is! CartLoaded) return;

    final current = (state as CartLoaded).items;
    final updated = _increaseLocal(current, productId);
    emit(CartState.loaded(updated));

    _debounceSave(() => cartRepository.increaseItem(productId: productId));
  }

  Future<void> decrease(int productId) async {
    if (state is! CartLoaded) return;

    final current = (state as CartLoaded).items;
    final updated = _decreaseLocal(current, productId);

    emit(CartState.loaded(updated));

    _debounceSave(() => cartRepository.decreaseItem(productId: productId));

  }

  Future<void> remove(int productId) async {
    if (state is! CartLoaded) return;

    final current = (state as CartLoaded).items;
    final updated = current..removeWhere((e) => e.productId == productId);

    emit(CartState.loaded(updated));

    _debounceSave(() => cartRepository.removeItem(productId: productId));
  }

  Future<void> clear() async {
    emit(const CartState.loaded([]));
    await cartRepository.clearCart();
  }

  List<CartItemEntity> _increaseLocal(List<CartItemEntity> items, int productId) {
    final updated = List<CartItemEntity>.from(items);
    final index = updated.indexWhere((e) => e.productId == productId);

    if (index == -1) {
      updated.add(CartItemEntity(productId: productId, quantity: 1));
    } else {
      final item = updated[index];
      updated[index] = item.copyWith(quantity: item.quantity + 1);
    }

    return updated;
  }

  List<CartItemEntity> _decreaseLocal(List<CartItemEntity> items, int productId) {
    final updated = List<CartItemEntity>.from(items);

    final index = updated.indexWhere((e) => e.productId == productId);
    if (index == -1) return updated;

    final item = updated[index];

    if (item.quantity <= 1) {
      updated.removeAt(index);
    } else {
      updated[index] = item.copyWith(quantity: item.quantity - 1);
    }

    return updated;
  }

  void _debounceSave(Future<void> Function() action) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 300), () => action());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
