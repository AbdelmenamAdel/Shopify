import 'package:shopify/core/services/graphql/admin/categories_queries.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/features/admin/categories/data/models/create_category_request_body.dart';
import 'package:shopify/features/admin/categories/data/models/create_category_response.dart';
import 'package:shopify/features/admin/categories/data/models/get_all_categories_reponse.dart';
import 'package:shopify/features/admin/categories/data/models/update_category_request_body.dart';

class CategoriesAdminDataSource {
  CategoriesAdminDataSource(this._graphql);
  final ApiService _graphql;

  Future<CategoriesGetAllResponse> getAllCategoriesAdmin() async {
    final response = await _graphql.getAllCategories(
      CategoriesQueries().getAllCategoriesMapQuery(),
    );
    return response;
  }

  Future<CreateCategoryResponse> createCategory(
    CreateCategoryRequestBody body,
  ) async {
    final response = await _graphql.createCategory(
      CategoriesQueries().createMapQuery(body: body),
    );
    return response;
  }

  Future<void> deleteCategory(String categoryId) async {
    await _graphql.deleteCategory(
      CategoriesQueries().deleteMapQuery(categoryId: categoryId),
    );
  }

  Future<void> updateCategory(UpdateCategoryRequestBody body) async {
    await _graphql.updateCategory(
      CategoriesQueries().updateMapQuery(body: body),
    );
  }
}
