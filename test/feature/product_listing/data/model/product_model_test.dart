import 'dart:convert';

import 'package:flutter_tdd_clean_bloc/features/product_listing/data/models/product_model.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const ProductModel tModel = ProductModel(
    title: 'test',
    description: 'test desc',
    price: 0,
    thumbnail: '',
  );
  test('should be of ProductEntity type', () {
    expect(tModel, isA<ProductEntity>());
  });
  group('Product Model fromJson', () {
    final data = json.decode(fixture('products.json'));
    const expected = ProductModel(
      title: 'test',
      description: 'test',
      price: 0,
      thumbnail: '',
    );
  });
}
