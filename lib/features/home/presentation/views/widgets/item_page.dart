import 'package:ecommerce_nti/features/home/presentation/views/widgets/product_card.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/products_items.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/recommended_products.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/app_responsive.dart';
import 'category_list.dart';
import 'custom_app_bar.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          SizedBox(height: 16),
          SectionTitle(title: 'All Featured'),
          SizedBox(height: 8),
          CategoriesList(),
          SizedBox(height: 16),
          SectionTitle(title: 'Products'),
          SizedBox(height: 8),
          ProductsItems(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}


