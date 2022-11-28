
import 'package:mobile_shop/network/models/category_model.dart';

class ProductsModel {
  int? count;
  int? totalPages;
  int? perPage;
  int? currentPage;
  List<ProductElement>? results;

  ProductsModel(
      {this.count,
      this.totalPages,
      this.perPage,
      this.currentPage,
      this.results});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalPages = json['total_pages'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    if (json['results'] != null) {
      results = <ProductElement>[];
      json['results'].forEach((v) {
        results!.add(ProductElement.fromJson(v));
      });
    }
  }
}

class ProductElement {
  CategoryModel? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  double? price;
  String? mainImage;
  int? id;

  ProductElement(
      {this.category,
      this.name,
      this.details,
      this.size,
      this.colour,
      this.price,
      this.mainImage,
      this.id});

  ProductElement.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    mainImage = json['main_image'];
    id = json['id'];
  }
}
