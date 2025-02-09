// ignore_for_file: one_member_abstracts, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_tdd_clean_bloc/config/path/product_api_path.dart';
import 'package:flutter_tdd_clean_bloc/core/error/exception.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  ///call api and throw [ServerException] if fails
  Future<ProductModel> getProduct();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  const ProductRemoteDataSourceImpl(this.dio);
  final Dio dio;
  @override
  Future<ProductModel> getProduct() async {
    final response = await dio.get(ProductApiPath.getProducts);
    if (response.statusCode == 200) {
      return ProductModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } else {
      throw ServerException();
    }
  }
}
