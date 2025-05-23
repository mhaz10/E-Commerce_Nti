import 'package:ecommerce_nti/core/helper/app_router.dart';
import 'package:ecommerce_nti/core/translation/translation_keys.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_images.dart';
import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:ecommerce_nti/features/onBoarding/views/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/app_responsive.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  PageController _pageController = PageController();
  int pageIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.chooseProducts,
      // pizza
      "title": TranslationKeys.onBoardingTitle1,
      "description": TranslationKeys.onBoardingDescription
    },
    {
      "image": AppImages.makePayment,
      // delivery
      "title": TranslationKeys.onBoardingTitle2,
      "description": TranslationKeys.onBoardingDescription
    },
    {
      "image": AppImages.getYourOrder,
      // enjoy food
      "title": TranslationKeys.onBoardingTitle3,
      "description": TranslationKeys.onBoardingDescription
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kGetStarted);
              },
              child: Text(
                TranslationKeys.skip,
                style: AppTextStyles.textStyle18,
                textAlign: TextAlign.end,
              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int pageIndex) {
                  setState(() {
                    this.pageIndex = pageIndex;
                  });
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(onboardingData[index]['image']!),
                      Text(
                        onboardingData[index]['title']!,
                        style: AppTextStyles.textStyle24,
                      ),
                      Text(
                        onboardingData[index]['description']!,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.textStyle14,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                pageIndex != 0 ? TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                        pageIndex - 1,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear
                    );
                  },
                  child: Text(
                    TranslationKeys.prev,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ) : SizedBox(width: AppResponsive.width(context, value: 50), height: AppResponsive.height(context, value: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => CustomIndicator(isActive: index == pageIndex),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (pageIndex == 2) {
                      GoRouter.of(context).pushReplacement(AppRouter.kGetStarted);
                    } else {
                      _pageController.animateToPage(
                          pageIndex + 1,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.linear
                      );
                    }
                  },
                  child: Text(
                    pageIndex == 2 ? TranslationKeys.getStarted : TranslationKeys.next,
                    style: AppTextStyles.textStyle18.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
