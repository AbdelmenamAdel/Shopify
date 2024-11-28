import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/products_view_all/data/data_source/products_view_all_data_source.dart';

class ProductsViewAllRepo {
  ProductsViewAllRepo(this._dataSource);

  final ProductsViewAllDataSource _dataSource;

  // Get Banners
  Future<ApiResult<GetAllProductsResponse>> getProductsViewAll({
    required int offset,
  }) async {
    try {
      final response = await _dataSource.getProductsViewAll(offset: offset);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
