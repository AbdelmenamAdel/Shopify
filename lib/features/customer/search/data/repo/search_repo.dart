import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/search/data/data_source/search_data_source.dart';
import 'package:shopify/features/customer/search/data/models/search_request_body.dart';

class SearchRepo {
  SearchRepo(this._dataSource);
  final SearchDataSource _dataSource;

  Future<ApiResult<GetAllProductsResponse>> searchProducts({
    required SearchRequestBody body,
  }) async {
    try {
      final response = await _dataSource.searchProducts(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
