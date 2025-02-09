import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ProductModel tModel = ProductModel(
    title: 'test',
    description: 'test desc',
    price: 0,
    thumbnail: '',
  );
  test('should be of ProductEntity type', () {
    expect(tModel, isA<ProductEntity>());
  });
}
