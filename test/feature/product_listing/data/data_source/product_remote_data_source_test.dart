// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tdd_clean_bloc/config/path/product_api_path.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/data_source/product_remote_data_source.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late final MockDio mockDio;
  late final ProductRemoteDataSource productRemoteDataSource;
  setUp(() {
    mockDio = MockDio();
    productRemoteDataSource = ProductRemoteDataSourceImpl(mockDio);
  });

  const ProductModel tProductModel =
      ProductModel(title: 'test', description: 'test', price: 0, thumbnail: '');

  test('should Return ProductModel ', () async {
    when(() => mockDio.get(ProductApiPath.getProducts)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: json.decode(
          fixture('products.json'),
        ),
      ),
    );

    final result = await productRemoteDataSource.getProduct();

    expect(result, tProductModel);
  });
}
