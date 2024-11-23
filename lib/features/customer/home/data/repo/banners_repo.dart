import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/customer/home/data/data_source/banners_data_source.dart';
import 'package:shopify/features/customer/home/data/models/banners_response.dart';

class BannersRepo {
  BannersRepo(this._dataSource);
  final BannersDataSource _dataSource;
  Future<ApiResult<BannersResponse>> getBanners() async {
    try {
      final response = await _dataSource.getBanners();
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
