import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

abstract class PasswordValidator {
  static String? validateMinLength(String value) {
    if (value.length < AppConstants.minPasswordLength) {
      return t.validatorErrors.minLengthPassword(
        count: AppConstants.minPasswordLength,
      );
    }
    return null;
  }

  static String? validatePasswordsMatch({
    required String password,
    required String confirmPassword,
  }) {
    if (password != confirmPassword) {
      return t.validatorErrors.passwordsNotMatch;
    }
    return null;
  }
}
