import 'package:malina_flutter_project/features/auth/domain/enum/auth_error.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

extension AuthErrorExt on AuthError {
  String get message => switch (this) {
    AuthError.userNotFound => t.auth.errors.userNotFound,
    AuthError.invalidEmailOrPassword => t.auth.errors.invalidEmailOrPassword,
    AuthError.tooManyAttempts => t.auth.errors.tooManyAttempts,
    AuthError.emailAlreadyExists => t.auth.errors.emailAlreadyExists,
    AuthError.unknown => t.auth.errors.unknown,
  };
}
