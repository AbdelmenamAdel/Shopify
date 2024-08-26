import 'package:shopify/core/services/graphql/admin/dashboard_queries.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/features/admin/dashboard/data/models/categories_count_response.dart';
import 'package:shopify/features/admin/dashboard/data/models/products_count_response.dart';
import 'package:shopify/features/admin/dashboard/data/models/users_count_response.dart';

class DashBoardDataSourse {
  DashBoardDataSourse(this._graphql);
  final ApiService _graphql;
  //!  Get Number of Products
  Future<ProductsCountResponse> numberOfProducts() async {
    final response = await _graphql.numberOfProducts(
      DashBoardQueries().numberOfProductsMapQuery(),
    );
    return response;
  }

  //!  Get Number of Categories
  Future<CategoriesCountResponse> numberOfCategories() async {
    final response = await _graphql.numberOfCategories(
      DashBoardQueries().numberOfCategoriesMapQuery(),
    );
    return response;
  }

  //!  Get Number of Users
  Future<UsersCountResponse> numberOfUsers() async {
    final response = await _graphql.numberOfUsers(
      DashBoardQueries().numberOfUsersMapQuery(),
    );
    return response;
  }
}
