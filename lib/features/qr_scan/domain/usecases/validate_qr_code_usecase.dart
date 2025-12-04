import 'package:malina_flutter_project/core/common/constants/app_constants.dart';

class ValidateQrCodeUseCase {
  ValidationQrResult call(String code) {
    if (code.startsWith("food")) {
      return ValidationQrResult.valid(code, category: AppConstants.productFood);
    } else if (code.startsWith("beauty")) {
      return ValidationQrResult.valid(code, category: AppConstants.productBeauty);
    } else {
     return ValidationQrResult.notValid(code, "Unknown QR data");
    }
  }

}

class ValidationQrResult {
  final bool isValid;
  final String? category;
  final String? error;
  final String code;

  ValidationQrResult.valid(this.code, {required this.category})
    : error = null,
      isValid = true;

  ValidationQrResult.notValid(this.code, this.error)
    : category = null,
      isValid = false;
}
