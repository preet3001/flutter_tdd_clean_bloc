import 'package:flutter_tdd_clean_bloc/core/usecase/usecase.dart';
import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/repositories/product_repository.dart';

class GetProducts implements UseCase<ProductEntity, NoParam> {
  const GetProducts(this.repository);
  final ProductRepository repository;
  @override
  Future<Result<ProductEntity>> call(NoParam param) async {
    return repository.getProducts();
  }
}
