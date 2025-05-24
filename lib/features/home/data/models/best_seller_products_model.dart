class BestSellerProductsModel {
  BestSellerProductsModel({
    required this.bestSellerProducts,
    required this.status,
  });

  final List<BestSellerProduct> bestSellerProducts;
  final bool? status;

  factory BestSellerProductsModel.fromJson(Map<String, dynamic> json){
    return BestSellerProductsModel(
      bestSellerProducts: json["best_seller_products"] == null ? [] : List<BestSellerProduct>.from(json["best_seller_products"]!.map((x) => BestSellerProduct.fromJson(x))),
      status: json["status"],
    );
  }

}

class BestSellerProduct {
  BestSellerProduct({
    required this.bestSeller,
    required this.category,
    required this.description,
    required this.id,
    required this.imagePath,
    required this.isFavorite,
    required this.name,
    required this.price,
    required this.rating,
  });

  final int? bestSeller;
  final CategoryModel? category;
  final String? description;
  final int? id;
  final String? imagePath;
  final bool? isFavorite;
  final String? name;
  final num? price;
  final double? rating;

  factory BestSellerProduct.fromJson(Map<String, dynamic> json){
    return BestSellerProduct(
      bestSeller: json["best_seller"],
      category: json["category"] == null ? null : CategoryModel.fromJson(json["category"]),
      description: json["description"],
      id: json["id"],
      imagePath: json["image_path"],
      isFavorite: json["is_favorite"],
      name: json["name"],
      price: json["price"],
      rating: json["rating"],
    );
  }

}

class CategoryModel {
  CategoryModel({
    required this.description,
    required this.id,
    required this.imagePath,
    required this.title,
  });

  final String? description;
  final int? id;
  final String? imagePath;
  final String? title;

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      description: json["description"],
      id: json["id"],
      imagePath: json["image_path"],
      title: json["title"],
    );
  }

}
