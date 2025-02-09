// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.title,
    required super.description,
    required super.price,
    required super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json['products'][0]['title'] as String,
        description: json['products'][0]['description'] as String,
        price: (json['products'][0]['price'] as num).toDouble(),
        thumbnail: json['products'][0]['thumbnail'] as String,
      );
}
