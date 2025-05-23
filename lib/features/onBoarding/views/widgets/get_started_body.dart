import 'package:ecommerce_nti/core/helper/app_responsive.dart';
import 'package:ecommerce_nti/core/translation/translation_keys.dart';
import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_images.dart';
import 'package:ecommerce_nti/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/app_router.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.getStarted, fit: BoxFit.cover),

          Container(color: Colors.black.withAlpha(90)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    TranslationKeys.youWantAuthenticHereYouGo,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle34,
                  ),

                  const SizedBox(height: 18),


                  Text(
                    TranslationKeys.findItHereBuyItNow,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textStyle14.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),

                  const SizedBox(height: 18),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kLoginView);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor, // vibrant pink
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        TranslationKeys.login,
                        style: AppTextStyles.textStyle24.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),


                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteColor, // vibrant pink
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        TranslationKeys.register,
                        style: AppTextStyles.textStyle24.copyWith(
                          color: AppColors.redColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppResponsive.height(context, value: 50)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
