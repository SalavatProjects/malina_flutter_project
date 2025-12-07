import 'package:malina_flutter_project/features/auth/domain/enum/auth_error.dart';

class AuthException implements Exception {
  final AuthError error;
  final int attemptsLeft;

  AuthException({
    required this.error,
    required this.attemptsLeft,
});
}