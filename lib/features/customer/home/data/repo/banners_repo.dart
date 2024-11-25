import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/categories/data/models/get_all_categories_reponse.dart';
import 'package:shopify/features/admin/products/data/models/get_all_products_response.dart';
import 'package:shopify/features/customer/home/data/data_source/banners_data_source.dart';
import 'package:shopify/features/customer/home/data/models/banners_response.dart';

class HomeRepo {
  HomeRepo(this._dataSource);
  final BannersDataSource _dataSource;
  Future<ApiResult<BannersResponse>> getBanners() async {
    try {
      final response = await _dataSource.getBanners();
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<GetAllProductsResponse>> getAllProducts() async {
    try {
      final response = await _dataSource.getAllProducts();
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CategoriesGetAllResponse>> getAllCategories() async {
    try {
      final response = await _dataSource.getAllCategories();
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
