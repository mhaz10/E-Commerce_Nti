import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? Colors.black : Colors.grey,
      ),
      margin: const EdgeInsets.only(right: 5),
      width: isActive ? 30 : 10,
      height: 10,
    );
  }
}
