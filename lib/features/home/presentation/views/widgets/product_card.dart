import 'package:ecommerce_nti/core/helper/app_responsive.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppResponsive.width(context, value: 163),
      height: AppResponsive.height(context, value: 305),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpfzVLGUoUJ73XJ8NTTrdVGMgRTVhubEuLpw&s",
              height: AppResponsive.height(context, value: 196),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Mens Starry",
            style: AppTextStyles.textStyle18,
          ),
          const SizedBox(height: 8),
          Text(
            "Sky Printed Shirt\n100% Cotton Fabric",
            style: AppTextStyles.textStyle12,
          ),
          const SizedBox(height: 6),
          Text(
            "₹399",
            style: AppTextStyles.textStyle14.copyWith(color: AppColors.blackColor),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.star, size: 14, color: AppColors.orangeColor),
              Icon(Icons.star, size: 14, color: AppColors.orangeColor),
              Icon(Icons.star, size: 14, color: AppColors.orangeColor),
              Text("4.5", style: AppTextStyles.textStyle12),
            ],
          ),
        ],
      ),
    );
  }
}