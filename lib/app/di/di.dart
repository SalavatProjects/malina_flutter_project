import 'package:get_it/get_it.dart';
import 'package:malina_flutter_project/features/auth/data/datasources/user_local_data_source.dart';
import 'package:malina_flutter_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:malina_flutter_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:malina_flutter_project/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:malina_flutter_project/features/cart/domain/repositories/cart_repository.dart';
import 'package:malina_flutter_project/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:malina_flutter_project/features/product/data/datasources/product_local_data_source.dart';
import 'package:malina_flutter_project/features/product/data/repositories/product_repository_impl.dart';
import 'package:malina_flutter_project/features/product/domain/repositories/product_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSource(getIt<SharedPreferences>()));

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<UserLocalDataSource>())
  );
  
  getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(getIt<AuthRepository>())
  );

  getIt.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(getIt<UserLocalDataSource>()));

  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt<ProductLocalDataSource>())
  );

  getIt.registerFactory(
      () => CartCubit(getIt<CartRepository>(), getIt<ProductRepository>()));
}