import 'package:ecommerce_nti/core/helper/app_validator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/translation/translation_keys.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/widgets/custom_text_form_filed.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
              Text(TranslationKeys.createAnAccount, style: AppTextStyles.textStyle36,),
              const SizedBox(height: 40),
              CustomTextFormFiled(
                  controller: _nameController,
                  hintText: TranslationKeys.fullName,
                  keyboardType: TextInputType.name,
                  validator: RequiredValidator(),
                  prefixIcon: AppIcons.passwordIcon
              ),
              const SizedBox(height: 20),
              CustomTextFormFiled(
                  controller: _phoneController,
                  hintText: TranslationKeys.phone,
                  keyboardType: TextInputType.number,
                  validator: PhoneValidator(),
                  prefixIcon: AppIcons.phoneIcon
              ),
              const SizedBox(height: 20),
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
                  hintText: TranslationKeys.password,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  validator: PasswordValidator(),
                  prefixIcon: AppIcons.passwordIcon
              ),
              const SizedBox(height: 20),
              CustomTextFormFiled(
                  controller: _confirmPasswordController,
                  hintText: TranslationKeys.confirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  validator: PasswordValidator(),
                  prefixIcon: AppIcons.passwordIcon
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.textStyle14.copyWith(color: AppColors.darkGreyColor),
                  children: [
                    TextSpan(text: TranslationKeys.byClickingThe),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: TranslationKeys.register,
                      style: AppTextStyles.textStyle14.copyWith(color: AppColors.redColor),
                    ),
                    TextSpan(text: ' '),
                    TextSpan(text: TranslationKeys.buttonYouAgreeToThePublicOffer),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
                  child: Text(TranslationKeys.register, style: AppTextStyles.textStyle20,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
