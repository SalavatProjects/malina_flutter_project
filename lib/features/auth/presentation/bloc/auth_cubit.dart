import 'package:bloc/bloc.dart';
import 'package:malina_flutter_project/features/auth/domain/enum/auth_error.dart';
import 'package:malina_flutter_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(const AuthState.initial());

  Future<void> register({required String email, required String password}) async {
    emit(const AuthState.loading());
    try {
      authRepository.register(email: email, password: password);
      emit(const AuthState.success("Registration successful"));
    } catch (e) {
      emit(AuthState.failure(AuthError.unknown));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final UserEntity? user = await authRepository.login(email: email, password: password);

    if (user == null) {
      emit(const AuthState.failure(AuthError.invalidEmailOrPassword));
      return;
    }

    emit(const AuthState.success("Login successful"));
  }
}
