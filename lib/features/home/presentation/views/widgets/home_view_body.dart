import 'package:ecommerce_nti/core/utils/app_colors.dart';
import 'package:ecommerce_nti/core/utils/app_icons.dart';
import 'package:ecommerce_nti/features/home/presentation/manger/home/home_cubit.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/item_page.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.redColor,
        shape: CircleBorder(),
        onPressed: () {},
        child: SvgPicture.asset(AppIcons.bagIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

        },
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.redColor,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.homeIcon, color: _currentIndex == 0 ? AppColors.redColor : Colors.grey,), label: 'Home'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.cartIcon, color: _currentIndex == 1 ? AppColors.redColor : Colors.grey,), label: 'Items'),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.profileIcon, color: _currentIndex == 2 ? AppColors.redColor : Colors.grey,), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(),
            ItemPage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}