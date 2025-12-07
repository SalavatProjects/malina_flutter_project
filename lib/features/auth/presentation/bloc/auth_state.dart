import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:malina_flutter_project/features/auth/domain/enum/auth_error.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success(UserEntity user) = AuthSuccess;
  const factory AuthState.failure({
    required AuthError error,
    String? message,
  }) = AuthFailure;
  const factory AuthState.loggedOut() = AuthLoggedOut;
}

