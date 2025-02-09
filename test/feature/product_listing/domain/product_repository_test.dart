import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tProduct = ProductEntity(
    title: 'test',
    description: 'test',
    price: 0,
    thumbnail: '',
  );
  late ProductRepository repository;
  setUp(() {});
}
