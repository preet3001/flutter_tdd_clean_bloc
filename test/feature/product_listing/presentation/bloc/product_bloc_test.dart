import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/usecases/get_products.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetProduct extends Mock implements GetProducts {}

void main() {
  late final MockGetProduct mockGetProduct;
  late final ProductBloc productBloc;
  setUp(() {
    mockGetProduct = MockGetProduct();
    productBloc = ProductBloc(mockGetProduct);
  });
  group('ProductBloc', () {
    test('InitialState', () {
      expect(productBloc.initialState, ProductInitialState());
    });
  });
}
