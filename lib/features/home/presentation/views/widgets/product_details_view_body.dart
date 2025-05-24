import 'package:ecommerce_nti/core/helper/app_responsive.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:ecommerce_nti/core/utils/widgets/expanded_text.dart';
import 'package:ecommerce_nti/features/home/data/models/best_seller_products_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final BestSellerProduct product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.product.imagePath ?? '',
                        fit: BoxFit.contain,
                        width: AppResponsive.width(context, value: 310),
                        height: AppResponsive.height(context, value: 310),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 25,
                    top: 6,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.greyColor.withAlpha(100),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.name ?? 'No Name',
                style: AppTextStyles.textStyle20.copyWith(color: AppColors.blackColor),
              ),
              const SizedBox(height: 8),
              ExpandedText(text: widget.product.description ?? 'No Description'),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    '${widget.product.price ?? 0} \$',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.pink),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                  ),
                  Text(quantity.toString(), style: const TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.pink),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add to cart logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added to cart')),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Add To Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
