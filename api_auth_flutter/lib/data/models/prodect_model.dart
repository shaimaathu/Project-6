import 'package:api_auth_flutter/data/models/categories_model.dart';

class ProductsModel {
  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });
  late final int? id;
  late final String? title;
  late final int? price;
  late final String? description;
  late final List<String>? images;
  late final String? creationAt;
  late final String? updatedAt;
  late final Category? category;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    data['category'] = category!.toJson();
    return data;
  }
}
