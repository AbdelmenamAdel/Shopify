import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/products/data/data_source/products_admin_data_source.dart';
import 'package:shopify/features/admin/products/data/models/create_product_request_body.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/admin/products/data/models/update_product_request_body.dart';

class ProductsAdminRepo {
  ProductsAdminRepo(this._dataSource);

  final ProductsAdminDataSource _dataSource;
  Future<ApiResult<GetAllProductsResponse>> getAllProductsAdmin() async {
    try {
      final result = await _dataSource.getAllProductsAdmin();
      return ApiResult.success(result);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  Future<ApiResult<void>> createProduct({
    required CreateProductRequestBody body,
  }) async {
    try {
      final result = await _dataSource.createProduct(body: body);
      return ApiResult.success(result);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  Future<ApiResult<void>> updateProduct({
    required UpdateProductRequestBody body,
  }) async {
    try {
      final result = await _dataSource.updateProduct(body: body);
      return ApiResult.success(result);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  Future<ApiResult<void>> deleteProduct({
    required String id,
  }) async {
    try {
      final result = await _dataSource.deleteProduct(id: id);
      return ApiResult.success(result);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }
}
