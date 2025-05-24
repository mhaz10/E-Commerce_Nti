import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryName, required this.categoryImage});

  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(categoryImage),
          ),
          const SizedBox(height: 5),
          Text(categoryName, style: AppTextStyles.textStyle12.copyWith(color: AppColors.blackColor)),
        ],
      ),
    );
  }
}