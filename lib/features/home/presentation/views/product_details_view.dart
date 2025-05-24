import 'package:ecommerce_nti/features/home/data/models/best_seller_products_model.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final BestSellerProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: const Text('Product'),
        centerTitle: true,
      ),
      body: ProductDetailsViewBody(product: product,),
    );
  }
}
