import 'package:malina_flutter_project/gen/strings.g.dart';

abstract class EmailValidator {
  static final RegExp _emailRegExp = RegExp(
    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
  );

  static String? validateIncorrectEmail(String value) {
    if (!_emailRegExp.hasMatch(value.trim())) {
      return t.validatorErrors.incorrectEmail;
    }

    return null;
  }
}
