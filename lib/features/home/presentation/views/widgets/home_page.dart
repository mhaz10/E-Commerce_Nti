import 'package:ecommerce_nti/features/home/presentation/views/widgets/recommended_products.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/section_title.dart';
import 'package:flutter/cupertino.dart';

import 'category_list.dart';
import 'custom_app_bar.dart';
import 'custom_search_bar.dart';
import 'custom_slider_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          SizedBox(height: 16),
          CustomSearchBar(),
          SizedBox(height: 16),
          SectionTitle(title: 'All Featured'),
          SizedBox(height: 8),
          CategoriesList(),
          SizedBox(height: 16),
          CustomSliderBanner(),
          SizedBox(height: 8),
          SectionTitle(title: 'Recommended'),
          SizedBox(height: 8),
          RecommendedProducts(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}