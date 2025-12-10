import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

class ParsedProductError implements Exception {
  final String message;
  ParsedProductError(this.message);
}

class ParseProductQrUseCase {
  ProductEntity parse(String qr) {
    try {
      final parts = qr.split('|');
      if (parts.length < 4) {
        throw ParsedProductError(t.qrScreen.errors.notValidQRCodeFormat);
      }
      final String category = parts[0].trim();
      final String subcategory = parts[1].trim();
      final String name = parts[2].trim();
      final double? price = double.tryParse(parts[3].trim());
      if (price == null) {
        throw ParsedProductError(t.qrScreen.errors.notValidPrice);
      }
      final String description = parts[4].trim();
      final String imagePath = parts[5].trim();

      return ProductEntity(
        id: "",
        category: _toCategory(category),
        subcategory: subcategory,
        name: name,
        description: description,
        price: price,
        imagePath: imagePath,
      );
    } catch (error) {
      throw ParsedProductError(t.qrScreen.errors.notValidQRCodeFormat);
    }
  }

  ProductCategory _toCategory(String raw) {
    if (raw == AppConstants.productFood) {
      return ProductCategory.food;
    } else if (raw == AppConstants.productBeauty) {
      return ProductCategory.beauty;
    } else {
      throw ParsedProductError(t.qrScreen.errors.unknownCategory(category: raw));
    };
  }
}

class ValidateQrCodeUseCase {
  ValidationQrResult call(String code) {
    if (code.startsWith("food")) {
      return ValidationQrResult.valid(code, category: AppConstants.productFood);
    } else if (code.startsWith("beauty")) {
      return ValidationQrResult.valid(
        code,
        category: AppConstants.productBeauty,
      );
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
