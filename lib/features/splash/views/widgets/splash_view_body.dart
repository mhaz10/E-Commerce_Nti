import 'package:ecommerce_nti/core/helper/app_responsive.dart';
import 'package:ecommerce_nti/core/helper/app_router.dart';
import 'package:ecommerce_nti/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache/ cache_data.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/cache/cache_keys.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    navigateToNextScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppImages.logo,
        width: AppResponsive.width(context, value: 274.99),
        height: AppResponsive.height(context, value: 100),
      ),
    );
  }

  void navigateToNextScreen(context) async {
    await Future.delayed((Duration(milliseconds: 500)), () {
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        CacheData.accessToken = CacheHelper.getData(key: CacheKeys.accessToken);
        if (CacheData.accessToken != null) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kGetStarted);
        }
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
      }
    });
  }
}
