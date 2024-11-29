import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/customer/search_queries.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/search/data/models/search_request_body.dart';

class SearchDataSource {
  SearchDataSource(this._api);
  final ApiService _api;
  Future<GetAllProductsResponse> searchProducts({
    required SearchRequestBody body,
  }) async {
    final response =
        await _api.searchProduct(SearchQueries().searchProduct(body: body));
    return response;
  }
}
