import 'package:get_it/get_it.dart';
import 'package:malina_flutter_project/features/auth/data/datasources/user_local_data_source.dart';
import 'package:malina_flutter_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:malina_flutter_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(),
  );
  
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<UserLocalDataSource>())
  );
  
  getIt.registerLazySingleton<AuthCubit>(
      () => AuthCubit(getIt<AuthRepository>())
  );
}