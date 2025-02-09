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
  test('Product Model fromJson', () {
    final data = json.decode(fixture('products.json')) as Map<String, dynamic>;
    const expected = ProductModel(
      title: 'test',
      description: 'test',
      price: 0,
      thumbnail: '',
    );

    final actual = ProductModel.fromJson(data);

    expect(actual, expected);
  });
}
