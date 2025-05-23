import 'package:ecommerce_nti/core/helper/app_validator.dart';
import 'package:ecommerce_nti/core/translation/translation_keys.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_icons.dart';
import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:ecommerce_nti/core/utils/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TranslationKeys.welcomeBack, style: AppTextStyles.textStyle36,),
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.redColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(TranslationKeys.login, style: AppTextStyles.textStyle20,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


