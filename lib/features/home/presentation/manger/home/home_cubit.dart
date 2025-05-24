import 'package:bloc/bloc.dart';
import 'package:ecommerce_nti/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/best_seller_products_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());

  final HomeRepo homeRepo;

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> categories = [];

  void getCategories() {

    homeRepo.getCategories().then((value) {
      value.fold(
        (error) {
          emit(HomeGetCategoriesFailureState(error.toString()));
        },
        (categories) {
          this.categories = categories;
          emit(HomeGetCategoriesSuccessState());
        },
      );
    });
  }

  List<Map<String, dynamic>> sliders = [];

  void getSliders() {
    homeRepo.getSliders().then((value) {
      value.fold(
        (error) {
          emit(HomeGetSlidersFailureState(error.toString()));
        },
        (sliders) {
          this.sliders = sliders;
          emit(HomeGetSlidersSuccessState());
        },
      );
    });
  }

  List<BestSellerProduct> bestSellerProducts = [];

  void getBestSellersProducts() {
    homeRepo.getBestSellerProducts().then((value) {
      value.fold(
        (error) {
          emit(HomeGetBestSellersProductsFailureState(error.toString()));
        },
        (bestSellerProducts) {
          this.bestSellerProducts = bestSellerProducts;
          emit(HomeGetBestSellersProductsSuccessState());
        },
      );
    });
  }
}
