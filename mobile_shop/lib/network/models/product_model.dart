import 'package:mobile_shop/network/models/category_model.dart';

class ProductModel {
  CategoryModel? category;
  String? name;
  String? details;
  String? size;
  String? colour;
  double? price;
  int? id;
  String? mainImage;
  List<Images>? images;
  List<Review>? reviews;

  ProductModel(
      {this.category,
      this.name,
      this.details,
      this.size,
      this.colour,
      this.price,
      this.id,
      this.mainImage,
      this.images,
      this.reviews});

  ProductModel.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    name = json['name'];
    details = json['details'];
    size = json['size'];
    colour = json['colour'];
    price = json['price'];
    id = json['id'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
  }
}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }
}

class Review {
  int? id;
  String? modifiedAt;
  String? createdAt;
  String? firstName;
  String? lastName;
  String? image;
  int? rating;
  String? message;

  Review(
      {this.id,
      this.modifiedAt,
      this.createdAt,
      this.firstName,
      this.lastName,
      this.image,
      this.rating,
      this.message});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modifiedAt = json['modified_at'];
    createdAt = json['created_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    rating = json['rating'];
    message = json['message'];
  }
}
