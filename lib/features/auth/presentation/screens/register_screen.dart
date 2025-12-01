import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/app/router/app_router.dart';

import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/common/widgets/app_buttons.dart';
import 'package:malina_flutter_project/core/common/widgets/app_text_form_field.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/core/utils/validators/email_validator.dart';
import 'package:malina_flutter_project/core/utils/validators/empty_field_validator.dart';
import 'package:malina_flutter_project/core/utils/validators/password_validator.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:malina_flutter_project/features/auth/presentation/bloc/auth_state.dart';
import 'package:malina_flutter_project/features/auth/presentation/extensions/auth_error_ext.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _repeatPasswordTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _showPassword = true;
  bool _showRepeatPassword = true;

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _repeatPasswordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            print('success');
          }
        },
        builder: (context, state) {
          return Padding(
            padding: .all(12.w),

            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  AppTextFormField(
                    textEditingController: _emailTextEditingController,
                    hintText: t.auth.mail.toCapitalize(),
                    onTextChanged: (String value) {},
                    suffixIcon: Icon(
                      Icons.cancel_outlined,
                      size: 20.w,
                      color: AppColors.greyMediumDark,
                    ),
                    validator: (String? value) {
                      return EmptyFieldValidator.validate(value) ??
                          EmailValidator.validateIncorrectEmail(value!);
                    },
                  ),
                  SizedBox(height: 12.w),
                  AppTextFormField.password(
                    textEditingController: _passwordTextEditingController,
                    onTextChanged: (String value) {},
                    hintText: t.auth.password.toCapitalize(),
                    obscureText: _showPassword,
                    suffixIcon: Icon(
                      _showPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onSuffixIconTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    validator: (String? value) {
                      return EmptyFieldValidator.validate(value) ??
                          PasswordValidator.validateMinLength(value!);
                    },
                  ),
                  SizedBox(height: 16.w),
                  Text('qer'),
                  AppPrimaryButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          email: _emailTextEditingController.text,
                          password: _passwordTextEditingController.text,
                        );
                      }
                    },
                    text: t.action.sign_in.toCapitalize(),
                  ),

                  if (state is AuthFailure)
                    Padding(
                      padding: EdgeInsetsGeometry.only(top: 16.w),
                      child: Text(
                        state.error.message,
                        style: AppStyles.robotoW400AlmostBlack(
                          AppFontSizes.sp14,
                        ).copyWith(color: AppColors.error),
                      ),
                    ),
                  SizedBox(height: 16.w),
                  // TODO: this widget not designed for UI
                  TextButton(
                    onPressed: () {
                      appRouter.goNamed(AppRoutes.login.name);
          },
                    child: Text(t.action.sign_in.toCapitalize()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

  }
}
