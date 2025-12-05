import 'package:bloc/bloc.dart';
import 'package:malina_flutter_project/features/auth/domain/enum/auth_error.dart';
import 'package:malina_flutter_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(const AuthState.initial());

  Future<void> checkAuthStatus() async {
    final bool isLoggedIn = await authRepository.isLoggedIn();
    final UserEntity? user = await authRepository.getCurrentUser();

    if (isLoggedIn && user != null) {
      emit(AuthState.success(user));
    } else {
      emit(const AuthState.loggedOut());
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    try {
      final UserEntity user = await authRepository.register(email: email, password: password);
      emit(AuthState.success(user));
    } catch (error) {
      if (error is AuthError) {
        emit(AuthState.failure(error));
      } else {
        emit(const AuthState.failure(AuthError.unknown));
      }
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final UserEntity? user = await authRepository.login(
      email: email,
      password: password,
    );

    if (user == null) {
      emit(const AuthState.failure(AuthError.invalidEmailOrPassword));
      return;
    }

    emit(AuthState.success(user));
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    await authRepository.logout();
    emit(const AuthState.loggedOut());
  }

  Future<void> deleteAccount() async {
    emit(const AuthState.loading());
    final UserEntity? user = await authRepository.getCurrentUser();
    if (user == null) {
      emit(const AuthState.loggedOut());
      return;
    }

    await authRepository.deleteUser(user.id);
    emit(const AuthState.loggedOut());
  }
}
