import 'package:ecommerce_nti/core/helper/app_responsive.dart';
import 'package:ecommerce_nti/core/helper/app_router.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/features/home/data/models/best_seller_products_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final BestSellerProduct product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductDetailsView, extra: product);
      },
      child: Container(
        width: AppResponsive.width(context, value: 163),
        height: AppResponsive.height(context, value: 305),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(26),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
              child: Image.network(
                product.imagePath ?? '',
                height: AppResponsive.height(context, value: 196),
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image_not_supported),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name ?? '',
                style: AppTextStyles.textStyle18,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.description ?? '',
                style: AppTextStyles.textStyle12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.price.toString(),
                style: AppTextStyles.textStyle14.copyWith(color: AppColors.blackColor),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  ...List.generate(
                    product.rating?.floor() ?? 0,
                        (_) => Icon(Icons.star, size: 14, color: AppColors.orangeColor),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    product.rating?.toString() ?? '',
                    style: AppTextStyles.textStyle12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
