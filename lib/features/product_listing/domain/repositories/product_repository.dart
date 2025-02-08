import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';

// ignore: one_member_abstracts
abstract interface class ProductRepository {
  Future<Result<ProductEntity>> getProducts();
}
