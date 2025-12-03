import 'package:malina_flutter_project/gen/strings.g.dart';

abstract class EmptyFieldValidator {
  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return t.validatorErrors.emptyField;
    }
    return null;
  }
}
