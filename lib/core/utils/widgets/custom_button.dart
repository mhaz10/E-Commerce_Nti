import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.onPressed, this.isLoading = false});

  final String? text;
  final bool isLoading;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.redColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading ? Center(child: CircularProgressIndicator(color: AppColors.whiteColor,)) : Text(text!, style: AppTextStyles.textStyle20,),
      ),
    );
  }
}