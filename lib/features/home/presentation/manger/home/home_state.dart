part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeGetCategoriesSuccessState extends HomeState {}

final class HomeGetCategoriesFailureState extends HomeState {
  final String error;
  HomeGetCategoriesFailureState(this.error);
}

final class HomeGetSlidersSuccessState extends HomeState {}

final class HomeGetSlidersFailureState extends HomeState {
  final String error;
  HomeGetSlidersFailureState(this.error);
}

final class HomeGetBestSellersProductsSuccessState extends HomeState {}

final class HomeGetBestSellersProductsFailureState extends HomeState {
  final String error;
  HomeGetBestSellersProductsFailureState(this.error);
}
