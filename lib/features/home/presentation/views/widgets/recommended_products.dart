import 'package:ecommerce_nti/features/home/presentation/manger/home/home_cubit.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_responsive.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (HomeCubit.get(context).bestSellerProducts.isNotEmpty) {
          return SizedBox(
            height: AppResponsive.height(context, value: 350),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: HomeCubit.get(context).bestSellerProducts.length,
              // Replace with actual count
              itemBuilder: (context, index) => ProductCard(product: HomeCubit.get(context).bestSellerProducts[index],),
              separatorBuilder:
                  (BuildContext context, int index) => SizedBox(width: 12),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
