import 'package:dartz/dartz.dart';

import '../models/best_seller_products_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<Map<String, dynamic>>>> getCategories();
  Future<Either<String, List<Map<String, dynamic>>>> getSliders();
  Future<Either<String, List<BestSellerProduct>>> getBestSellerProducts();

}