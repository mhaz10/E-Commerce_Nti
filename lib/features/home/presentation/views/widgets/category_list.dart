import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  final List<Map<String, String>> categories = const [
    {
      'name' : 'Beauty',
      'image' : 'https://img.freepik.com/free-photo/different-cosmetics-types-scattered-pink-table_23-2148046961.jpg',
    },
    {
      'name' : 'Beauty',
      'image' : 'https://img.freepik.com/free-photo/different-cosmetics-types-scattered-pink-table_23-2148046961.jpg',
    },
    {
      'name' : 'Beauty',
      'image' : 'https://img.freepik.com/free-photo/different-cosmetics-types-scattered-pink-table_23-2148046961.jpg',
    },
    {
      'name' : 'Beauty',
      'image' : 'https://img.freepik.com/free-photo/different-cosmetics-types-scattered-pink-table_23-2148046961.jpg',
    },
    {
      'name' : 'Beauty',
      'image' : 'https://img.freepik.com/free-photo/different-cosmetics-types-scattered-pink-table_23-2148046961.jpg',
    }
  ];

  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: categories.map((category) => CategoryItem(categoryName: category['name']!, categoryImage: category['image']!,)).toList(),
      ),
    );
  }
}