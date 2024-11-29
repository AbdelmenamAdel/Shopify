import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/customer/product_details/data/data_source/product_details_data_source.dart';
import 'package:shopify/features/customer/product_details/models/product_details_response.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._dataSource);

  final ProductDetailsDataSource _dataSource;

  Future<ApiResult<ProductDetailsResponse>> getProductDetails({
    required int productId,
  }) async {
    try {
      final response =
          await _dataSource.getProductDetails(productId: productId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
