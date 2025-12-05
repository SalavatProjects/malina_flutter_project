import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/common/widgets/app_buttons.dart';
import 'package:malina_flutter_project/core/common/widgets/custom_app_bar.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import '../../../auth/presentation/bloc/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onActionPressed: () {
          context.read<AuthCubit>().logout();
        },
        actionText: t.action.signOut.toCapitalize(),
        title: t.profile.toCapitalize(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.w),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoggedOut) {
                appRouter.goNamed(AppRoutes.login.name);
              }
            },
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Column(
                  crossAxisAlignment: .start,
                  // mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      state.user.email,
                      style: AppStyles.wixMadeforDisplayW700AlmostBlack(
                        AppFontSizes.sp20,
                      ),
                    ),
                    const Spacer(),
                    AppPrimaryButton(
                      onPressed: () {
                        context.read<AuthCubit>().deleteAccount();
                      },
                      text: t.action.delete.toCapitalize(),
                    ),
                    SizedBox(height: 60.w),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
