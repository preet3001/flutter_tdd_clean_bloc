import 'package:bloc/bloc.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/usecases/get_products.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_event.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this.getProducts) : super(ProductInitialState()) {}
  final GetProducts getProducts;
}
