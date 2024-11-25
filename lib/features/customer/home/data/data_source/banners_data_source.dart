import 'package:shopify/core/services/graphql/admin/categories_queries.dart';
import 'package:shopify/core/services/graphql/admin/products_queries.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/customer/home_queries.dart';
import 'package:shopify/features/admin/categories/data/models/get_all_categories_reponse.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/home/data/models/banners_response.dart';

class BannersDataSource {
  BannersDataSource(this._api);
  final ApiService _api;
  Future<BannersResponse> getBanners() async {
    final response = await _api.getBanners(HomeQueries().getBannersMapQuery());
    return response;
  }

  Future<CategoriesGetAllResponse> getAllCategories() async {
    final response = await _api.getAllCategories(
      CategoriesQueries().getAllCategoriesMapQuery(),
    );
    return response;
  }

  Future<GetAllProductsResponse> getAllProducts() async {
    final response = await _api.getAllProduct(
      ProductsQueries().getAllProductsMapQuery(),
    );
    return response;
  }
}
