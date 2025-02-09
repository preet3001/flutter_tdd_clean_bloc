import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/data_source/product_remote_data_source.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({required this.productRemoteDataSource});
  final ProductRemoteDataSource productRemoteDataSource;
  @override
  Future<Result<ProductEntity>> getProducts() async {
    final data = await productRemoteDataSource.getProduct();
    return Result.ok(data);
  }
}
