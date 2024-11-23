import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/core/services/graphql/customer/home_queries.dart';
import 'package:shopify/features/customer/home/data/models/banners_response.dart';

class BannersDataSource {
  BannersDataSource(this._api);
  final ApiService _api;
  Future<BannersResponse> getBanners() async {
    final response = await _api.getBanners(HomeQueries().getBannersMapQuery());
    return response;
  }
}
