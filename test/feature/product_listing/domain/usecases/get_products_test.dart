// ignore_for_file: omit_local_variable_types

import 'package:flutter_tdd_clean_bloc/core/usecase/usecase.dart';
import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late final MockProductRepository repository;
  late final GetProduct usecase;
  setUp(() {
    repository = MockProductRepository();
    usecase = GetProduct(repository);
  });
  const ProductEntity tProduct = ProductEntity(
    title: 'test',
    description: 'test desc',
    price: 0,
    thumbnail: '',
  );

  test('should get products', () async {
    when(() => repository.getProducts())
        .thenAnswer((_) async => const Result.ok(tProduct));

    final result = await usecase(NoParam());

    expect(result, const Result.ok(tProduct));
    verify(() => repository.getProducts());
    verifyNoMoreInteractions(repository);
  });
}
