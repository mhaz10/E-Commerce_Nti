import 'package:ecommerce_nti/features/home/presentation/manger/home/home_cubit.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_responsive.dart';

class ProductsItems extends StatelessWidget {
  const ProductsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (HomeCubit.get(context).bestSellerProducts.isNotEmpty) {
          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: AppResponsive.width(context, value: 163) /
                AppResponsive.height(context, value: 310),
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: List.generate(HomeCubit.get(context).bestSellerProducts.length, (index) => ProductCard(product: HomeCubit.get(context).bestSellerProducts[index]),),
          );
        }

        return SizedBox();
      },
    );
  }
}