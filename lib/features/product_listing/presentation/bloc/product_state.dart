import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/entities/product_entity.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductCompletedState extends ProductState {
  const ProductCompletedState(this.productEntity);
  final ProductEntity productEntity;

  @override
  List<Object?> get props => [productEntity];
}

class ProductFailureState extends ProductState {
  const ProductFailureState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
