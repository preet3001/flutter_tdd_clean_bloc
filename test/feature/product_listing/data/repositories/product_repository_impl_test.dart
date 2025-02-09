import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/data_source/product_remote_data_source.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/models/product_model.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/repositories/product_repository_impl.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

void main() {
  late final MockProductRemoteDataSource mockProductRemoteDataSource;
  late final ProductRepositoryImpl productRepositoryImpl;
  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImpl = ProductRepositoryImpl(
      productRemoteDataSource: mockProductRemoteDataSource,
    );
  });
  const tProductModel =
      ProductModel(title: 'test', description: 'test', price: 0, thumbnail: '');
  const ProductEntity tProductEntity = tProductModel;
  test('should return ProductModel from repository', () async {
    when(() => mockProductRemoteDataSource.getProduct())
        .thenAnswer((_) async => tProductModel);

    final result = await productRepositoryImpl.getProducts();

    expect(result.asOk.value, tProductEntity);
    verify(() => mockProductRemoteDataSource.getProduct());
  });
}
