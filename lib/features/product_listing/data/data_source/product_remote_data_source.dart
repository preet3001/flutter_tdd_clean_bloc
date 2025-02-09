// ignore_for_file: one_member_abstracts

import 'package:flutter_tdd_clean_bloc/core/error/exception.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  ///call api and throw [ServerException] if fails
  Future<ProductModel> getProduct();
}
