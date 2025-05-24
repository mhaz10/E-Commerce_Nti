import 'package:ecommerce_nti/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_responsive.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.height(context, value: 350),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4, // Replace with actual count
        itemBuilder: (context, index) => const ProductCard(),
      ),
    );
  }
}