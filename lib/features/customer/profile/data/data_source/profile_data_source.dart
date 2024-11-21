import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/features/auth/data/models/login/user_role_response.dart';

class ProfileDataSource {
  ProfileDataSource(this._api);
  final ApiService _api;
  Future<UserRoleResponse> getUserInfo() async {
    final response = await _api.userRole();
    return response;
  }
}
