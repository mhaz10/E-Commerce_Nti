import 'package:ecommerce_nti/core/helper/app_validator.dart';
import 'package:ecommerce_nti/core/translation/translation_keys.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_icons.dart';
import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:ecommerce_nti/core/utils/app_toast.dart';
import 'package:ecommerce_nti/core/utils/widgets/custom_button.dart';
import 'package:ecommerce_nti/core/utils/widgets/custom_text_form_filed.dart';
import 'package:ecommerce_nti/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/app_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is LoginFailureState) {
          AppToast.showErrorToast(state.error);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TranslationKeys.welcomeBack,
                  style: AppTextStyles.textStyle36,),
                const SizedBox(height: 40),
                CustomTextFormFiled(
                    controller: _emailController,
                    hintText: TranslationKeys.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: EmailValidator(),
                    prefixIcon: AppIcons.emailIcon
                ),
                const SizedBox(height: 20),
                CustomTextFormFiled(
                    controller: _passwordController,
                    isPassword: true,
                    hintText: TranslationKeys.password,
                    keyboardType: TextInputType.visiblePassword,
                    validator: PasswordValidator(),
                    prefixIcon: AppIcons.passwordIcon
                ),
                const SizedBox(height: 40),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return CustomButton(
                        isLoading: true,
                      );
                    }
                    return CustomButton(
                      text: TranslationKeys.login,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginCubit.get(context).login(
                              username: _emailController.text,
                              password: _passwordController.text);
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}