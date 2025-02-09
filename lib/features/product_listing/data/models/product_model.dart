import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.title,
    required super.description,
    required super.price,
    required super.thumbnail,
  });
}
