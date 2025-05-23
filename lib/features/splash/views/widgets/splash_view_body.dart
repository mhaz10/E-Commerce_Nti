import 'package:ecommerce_nti/core/helper/app_responsive.dart';
import 'package:ecommerce_nti/core/helper/app_router.dart';
import 'package:ecommerce_nti/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  @override
  void initState() {
    navigateToNextScreen();
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

  void navigateToNextScreen() async  {
    await  Future.delayed(const Duration(milliseconds: 500), () => GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding));
  }
}
