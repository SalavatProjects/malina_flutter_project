import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

abstract class PasswordValidator {
  static String? validateMinLength(String value) {
    if (value.length < AppConstants.minPasswordLength) {
      return t.validator_errors.min_length_password(count: AppConstants.minPasswordLength);
    }
    return null;
  }
}