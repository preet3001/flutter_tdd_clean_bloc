import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_clean_bloc/core/di/service_locator.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_bloc.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_state.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/widget/product_item.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<ProductBloc>(
        create: (context) => di(),
        child: BlocConsumer<ProductBloc, ProductState>(
          builder: (context, state) => switch (state) {
            ProductLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            ProductFailureState() => Center(
                child: Text(state.message),
              ),
            ProductCompletedState() => Center(
                child: ProductItem(item: state.productEntity),
              ),
            _ => const SizedBox(),
          },
          listener: (_, state) {},
        ),
      ),
    );
  }
}
