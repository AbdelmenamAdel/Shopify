import 'package:shopify/core/services/graphql/admin/products_queries.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/features/admin/products/data/models/create_product_request_body.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/admin/products/data/models/update_product_request_body.dart';

class ProductsAdminDataSource {
  ProductsAdminDataSource(this._graphql);

  final ApiService _graphql;

  Future<GetAllProductsResponse> getAllProductsAdmin() async {
    final result = await _graphql.getAllProduct(
      ProductsQueries().getAllProductsMapQuery(),
    );
    return result;
  }

  Future<void> createProduct({required CreateProductRequestBody body}) async {
    final result = await _graphql
        .createProduct(ProductsQueries().createProductMapQuery(body: body));
    return result;
  }

  Future<void> updateProduct({required UpdateProductRequestBody body}) async {
    final result = await _graphql
        .updateProduct(ProductsQueries().updateProductMapQuery(body: body));
    return result;
  }

  Future<void> deleteProduct({required String id}) async {
    final result = await _graphql
        .deleteProduct(ProductsQueries().deleteProductMapQuery(productId: id));
    return result;
  }
}
