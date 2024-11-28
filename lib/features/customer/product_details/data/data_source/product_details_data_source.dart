import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/customer/product_details_queries.dart';
import 'package:shopify/features/customer/product_details/models/product_details_response.dart';

class ProductDetailsDataSource {
  ProductDetailsDataSource(this._api);

  final ApiService _api;
  Future<ProductDetailsResponse> getProductDetails({
    required int productId,
  }) async {
    final response = await _api.productDetails(
      ProductDetailsQueries().getProductDetailsMapQuery(id: productId),
    );
    return response;
  }
}
