import 'package:ecommerce_nti/features/home/data/repo/home_repo_implemation.dart';
import 'package:ecommerce_nti/features/home/presentation/manger/home/home_cubit.dart';
import 'package:ecommerce_nti/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImplementation())..getCategories()..getSliders()..getBestSellersProducts(),
      child: HomeViewBody(),
    );
  }
}
