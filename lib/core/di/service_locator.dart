import 'package:dio/dio.dart';
import 'package:flutter_tdd_clean_bloc/config/base_api_url.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/data_source/product_remote_data_source.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/data/repositories/product_repository_impl.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/domain/usecases/get_products.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_bloc.dart';
import 'package:flutter_tdd_clean_bloc/features/product_listing/presentation/bloc/product_event.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.I;

Future<void> initServiceLocator() async {
  di.registerFactory(
    () => ProductBloc(
      GetProducts(
        ProductRepositoryImpl(
          productRemoteDataSource: ProductRemoteDataSourceImpl(
            Dio(
              BaseOptions(baseUrl: BaseApiUrl.productBaseUrl),
            ),
          ),
        ),
      ),
    )..add(
        FetchProduct(),
      ),
  );
}
