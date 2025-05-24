import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/app_validator.dart';
import '../app_colors.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({super.key, required this.hintText, required this.keyboardType, required this.prefixIcon, required this.validator, this.isPassword = false, required this.controller});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String prefixIcon;
  final bool isPassword;
  final AppValidator validator;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      cursorColor: AppColors.greyColor,
      keyboardType: widget.keyboardType,
      validator: widget.validator.validate,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.greyColor.withAlpha(100),
        hintText: widget.hintText,
        prefixIcon: SvgPicture.asset(widget.prefixIcon, width: 24, height: 24, fit: BoxFit.none,),
        suffixIcon:  widget.isPassword ? IconButton(onPressed: () {setState(() {
            isObscure = !isObscure;
          });}, icon: isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility) ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.greyColor.withAlpha(80)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.greyColor.withAlpha(80)),
        ),
      ),
    );
  }
}