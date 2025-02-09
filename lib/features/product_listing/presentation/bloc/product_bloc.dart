import 'package:bloc/bloc.dart';
import 'package:flutter_tdd_clean_bloc/core/usecase/usecase.dart';
import 'package:flutter_tdd_clean_bloc/core/util/result.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/usecases/get_products.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_event.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.getProducts) : super(ProductInitialState()) {
    on<FetchProduct>(_fetchProduct);
  }
  final GetProducts getProducts;
  late ProductEntity entity;

  Future<void> _fetchProduct(
    ProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoadingState());
    final result = await getProducts(NoParam());
    switch (result) {
      case Ok():
        emit(ProductCompletedState(result.value));
      default:
        emit(const ProductFailureState('Some thing went wrong'));
    }
  }
}
