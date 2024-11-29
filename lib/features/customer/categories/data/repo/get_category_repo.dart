import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/categories/data/datasource/get_category_datasource.dart';

class GetCategoryRepo {
  GetCategoryRepo(this._datasource);

  final GetCategoryDataSource _datasource;

  Future<ApiResult<GetAllProductsResponse>> getCategory({
    required int categoryId,
  }) async {
    try {
      final response = await _datasource.getCategories(categoryId: categoryId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
