import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/categories/data/data_source/categories_admin_data_sourse.dart';
import 'package:shopify/features/admin/categories/data/models/create_category_request_body.dart';
import 'package:shopify/features/admin/categories/data/models/create_category_response.dart';
import 'package:shopify/features/admin/categories/data/models/get_all_categories_reponse.dart';
import 'package:shopify/features/admin/categories/data/models/update_category_request_body.dart';

class CategoreisAdminRepo {
  const CategoreisAdminRepo(this._dataSource);

  final CategoriesAdminDataSource _dataSource;

  // Get All Categories Admin
  Future<ApiResult<CategoriesGetAllResponse>> getAllCategoriesAdmin() async {
    try {
      final response = await _dataSource.getAllCategoriesAdmin();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  // Create a new Category
  Future<ApiResult<CreateCategoryResponse>> createCategory({
    required CreateCategoryRequestBody body,
  }) async {
    try {
      final response = await _dataSource.createCategory(body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  // Delete Category
  Future<ApiResult<void>> deleteCategory({
    required String categoryIds,
  }) async {
    try {
      final response = await _dataSource.deleteCategory(categoryIds);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  // Update Category
  Future<ApiResult<void>> updateCategory({
    required UpdateCategoryRequestBody body,
  }) async {
    try {
      final response = await _dataSource.updateCategory(body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }
}
