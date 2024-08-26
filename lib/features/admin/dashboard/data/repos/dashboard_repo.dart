import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/dashboard/data/data_source/dashboard_data_sourse.dart';
import 'package:shopify/features/admin/dashboard/data/models/categories_count_response.dart';
import 'package:shopify/features/admin/dashboard/data/models/products_count_response.dart';
import 'package:shopify/features/admin/dashboard/data/models/users_count_response.dart';

class DashBoardRepo {
  DashBoardRepo(this._dataSource);
  final DashBoardDataSourse _dataSource;
  // ! Get Number of Products
  Future<ApiResult<ProductsCountResponse>> numberOfProducts() async {
    try {
      final response = await _dataSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  // ! Get Number of Categories
  Future<ApiResult<CategoriesCountResponse>> numberOfCategories() async {
    try {
      final response = await _dataSource.numberOfCategories();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  // ! Get Number of Users
  Future<ApiResult<UsersCountResponse>> numberOfUsers() async {
    try {
      final response = await _dataSource.numberOfUsers();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }
}
