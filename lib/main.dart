import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_flutter_project/app/di/di.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/features/cart/presentation/bloc/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  final AuthCubit authCubit = getIt<AuthCubit>();
  final CartCubit cartCubit = getIt<CartCubit>();
  await authCubit.checkAuthStatus();

  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>.value(
        value: authCubit,
      ),
      BlocProvider<CartCubit>.value(
          value: cartCubit,
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp.router(
        // title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background
          // colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}

