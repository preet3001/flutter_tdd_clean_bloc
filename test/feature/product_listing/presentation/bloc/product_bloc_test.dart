import 'dart:async';

import 'package:flutter_tdd_clean_bloc/core/usecase/usecase.dart';
import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/repositories/product_repository.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/usecases/get_products.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_bloc.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_event.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProduct extends Mock implements GetProducts {}

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockGetProduct mockGetProduct;
  late ProductBloc productBloc;

  const ProductEntity tProduct = ProductEntity(
    title: 'test',
    description: 'test',
    price: 0,
    thumbnail: '',
  );
  setUp(() {
    mockGetProduct = MockGetProduct();
    productBloc = ProductBloc(mockGetProduct);
  });

  group('ProductBloc', () {
    test('InitialState', () {
      expect(productBloc.state, ProductInitialState());
    });

    test('FetchProduct', () async {
      when(() => mockGetProduct(NoParam()))
          .thenAnswer((_) async => const Result.ok(tProduct));
      productBloc.add(FetchProduct());
      await untilCalled(() => mockGetProduct(NoParam()));
      verify(() => mockGetProduct(NoParam()));
    });

    test('FetchProduct order', () async {
      when(() => mockGetProduct(NoParam()))
          .thenAnswer((_) async => const Result.ok(tProduct));
      final expected = [
        ProductLoadingState(),
        const ProductCompletedState(tProduct),
      ];
      unawaited(expectLater(productBloc.stream, emitsInOrder(expected)));
      productBloc.add(FetchProduct());
    });
  });
}
