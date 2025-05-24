import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({super.key, required this.text});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          flag ? firstHalf! : (firstHalf! + secondHalf!),
          style: AppTextStyles.textStyle14,
        ),
        if (secondHalf!.isNotEmpty)
          InkWell(
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Row(
              children: [
                Text(flag ? 'Show More' : 'Show Less', style: AppTextStyles.textStyle14.copyWith(color: Colors.amber)),
                Icon(flag ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined, color: Colors.amber),
              ],
            ),
          ),
      ],
    );
  }
}