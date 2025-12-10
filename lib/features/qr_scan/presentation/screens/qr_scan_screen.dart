import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/core/services/id_generator.dart';
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
  final MobileScannerController _mobileScannerController =
      MobileScannerController();
  String? _errorMessage;
  ProductEntity? _scannedProduct;

  @override
  void dispose() {
    super.dispose();
    _mobileScannerController.dispose();
  }

  // TODO: variables below deprecated more
  bool _isLoading = false;

  final ValidateQrCodeUseCase _validateQrCodeUseCase = ValidateQrCodeUseCase();
  final ProductFromQrFactory _productFromQrFactory = ProductFromQrFactory();

  Future<void> _simulateScan() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    const String qrData = "food123";

    final result = _validateQrCodeUseCase(qrData);

    if (!result.isValid) {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Ошибка QR",
              style: AppStyles.wixMadeforDisplayW400White(
                AppFontSizes.sp16,
              ).copyWith(color: AppColors.error),
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
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.isLandscape ? MediaQuery.of(context).size.width * 0.46 : MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                MobileScanner(
                  controller: _mobileScannerController,
                  fit: BoxFit.cover,
                  onDetect: (BarcodeCapture result) async {
                    try {
                      final String? value = result.barcodes.first.rawValue;
                      if (value == null) {
                        setState(() {
                          _errorMessage = t.qrScreen.errors.unsuccessfullScan;
                        });
                        return;
                      };
                      setState(() {
                        _scannedProduct = ParseProductQrUseCase().parse(value);
                      });
                    } catch (error) {
                      setState(() {
                        if (error is ParsedProductError) {
                          _errorMessage = error.message;
                        } else {
                          _errorMessage = error.toString();
                        }

                      });
                    } finally {
                      await _mobileScannerController.stop();
                    }
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(context.isLandscape ? 10.w : 20.w),
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Icon(Icons.close, size: context.isLandscape ? 18.w : 26.w, color: AppColors.grey),
                    ),
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
                      SizedBox(height: context.isLandscape ? 10.w : 26.w),
                      SizedBox(
                        width: context.isLandscape ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.width * 0.8,
                        height: context.isLandscape ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.width * 0.8,
                        child: CustomPaint(painter: ScannerBorderPainter()),
                      ),
                    ],
                  ),
                ),
                if (_errorMessage != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.all(20.w),
                      child: IntrinsicHeight(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.white
                          ),
                          child: Center(
                            child: Text(_errorMessage!, style: AppStyles.robotoW400AlmostBlack(AppFontSizes.sp16).copyWith(
                              color: AppColors.error
                            ),),
                          ),
                        ),
                      ),
                    ),
                  )
                else if (_scannedProduct != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsetsGeometry.all(20.w),
                    child: ProductCardFromQr(
                        product: _scannedProduct!,
                        onPressed: () async {
                          final int productId = await IdGenerator.next(AppConstants.productsCollectionName);
                          context.pop(_scannedProduct?.copyWith(id: productId.toString()));
                          _scannedProduct = null;
                        }),),
                  )
              ],
            ),
          ),
        ),

        /*Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: Stack(
            // fit: StackFit.expand,
            children: [


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
                        _scannedProduct = null;
                      },
                  ),
                )
            ],
          ),
        )*/
      ),
    );
  }
}
