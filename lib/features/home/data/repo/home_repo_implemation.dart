import 'package:dartz/dartz.dart';
import 'package:ecommerce_nti/core/network/api_response.dart';
import 'package:ecommerce_nti/features/home/data/models/best_seller_products_model.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';
import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  static final HomeRepoImplementation _instance = HomeRepoImplementation._internal();
  factory HomeRepoImplementation() => _instance;
  HomeRepoImplementation._internal();

  ApiHelper apiHelper = ApiHelper();
  
  @override
  Future<Either<String, List<Map<String, dynamic>>>> getCategories() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.categories,
        isProtected: true,
      );

      if (response.status) {
        List<Map<String, dynamic>> categories = [];
        for (var category in response.data['categories']) {
          categories.add({
            'id': category['id'],
            'title': category['title'],
            'image_path': category['image_path'],
          });
        }
        return Right(categories);
      } else {
        return Left("Failed to load categories");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, List<Map<String, dynamic>>>> getSliders() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.sliders,
      );

      if (response.status) {
        List<Map<String, dynamic>> sliders = [];
        for (var category in response.data['sliders']) {
          sliders.add({
            'id': category['id'],
            'title': category['title'],
            'image_path': category['image_path'],
          });
        }
        return Right(sliders);
      } else {
        return Left("Failed to load sliders");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, List<BestSellerProduct>>> getBestSellerProducts() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.bestSellerProducts,
        isProtected: true,
      );
      BestSellerProductsModel bestSellerProductsModel = BestSellerProductsModel.fromJson(response.data);
      if (bestSellerProductsModel.status != null) {
        return Right(bestSellerProductsModel.bestSellerProducts);
      } else {
        return Left("Failed to load best seller products");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}