import 'package:ecommerce_nti/features/home/presentation/manger/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_item.dart';


class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (HomeCubit.get(context).categories.isNotEmpty) {
          return SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children:
              HomeCubit.get(context).categories
                      .map(
                        (category) => CategoryItem(
                          categoryId: category['id']!,
                          categoryName: category['title']!,
                          categoryImage: category['image_path']!,
                        ),
                      )
                      .toList(),
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
