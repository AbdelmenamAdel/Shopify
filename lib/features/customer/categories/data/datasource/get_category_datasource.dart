import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/customer/category_queries.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';

class GetCategoryDataSource {
  GetCategoryDataSource(this._api);

  final ApiService _api;
  Future<GetAllProductsResponse> getCategories({
    required int categoryId,
  }) async {
    final response = _api.getCategory(
      CategoryQueries().getCatgeoryMapQuery(categoryId: categoryId),
    );
    return response;
  }
}
