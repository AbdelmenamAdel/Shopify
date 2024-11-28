import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/customer/products_view_all_queries.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';

class ProductsViewAllDataSource {
  const ProductsViewAllDataSource(this._graphql);

  final ApiService _graphql;

  // Products View ALl
  Future<GetAllProductsResponse> getProductsViewAll({
    required int offset,
  }) async {
    final response = await _graphql.getProductsViewAll(
      ProductViewAllQueries().getProductsViewAllMapQuery(offset: offset),
    );
    return response;
  }
}
