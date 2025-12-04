import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/features/qr_scan/domain/factories/product_from_qr_factory.dart';
import 'package:malina_flutter_project/features/qr_scan/domain/usecases/validate_qr_code_usecase.dart';
import 'package:malina_flutter_project/features/qr_scan/presentation/widgets/product_card_from_qr.dart';
import 'package:malina_flutter_project/features/qr_scan/presentation/widgets/scanner_border_painter.dart';
import 'package:malina_flutter_project/features/shared/data/mappers/product_mapper.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  ProductEntity? _scannedProduct;
  bool _isLoading = false;

  final ValidateQrCodeUseCase _validateQrCodeUseCase = ValidateQrCodeUseCase();
  final ProductFromQrFactory _productFromQrFactory = ProductFromQrFactory();

  Future<void> _simulateScan() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    const String qrData = "food123";

    final result = _validateQrCodeUseCase(qrData);

    if (!result.isValid) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Ошибка QR",
              style: AppStyles.wixMadeforDisplayW400White(AppFontSizes.sp16).copyWith(
                color: AppColors.error
              ),
            ),
          ),
        );
      });
    }

    final model = await _productFromQrFactory.create(qrData);

    final entity = model.toEntity();
    setState(() {
      _isLoading = false;
      _scannedProduct = entity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Stack(
            // fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Icon(Icons.close, size: 26.w, color: AppColors.grey),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Text(
                      t.placeTheQr,
                      style: AppStyles.wixMadeforDisplayW400White(
                        AppFontSizes.sp18,
                      ),
                    ),
                    SizedBox(height: 26.w),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: CustomPaint(painter: ScannerBorderPainter()),
                    ),
                  ],
                ),
              ),
              if (!_isLoading && _scannedProduct == null)
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(onPressed: () {
                  _simulateScan();
                }, child: const Text("Симулировать QR")),
              )
              else if (_isLoading)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(),
                )
              else if (!_isLoading && _scannedProduct != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ProductCardFromQr(
                      product: _scannedProduct!,
                      onPressed: () {
                        context.pop(_scannedProduct);
                      },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
