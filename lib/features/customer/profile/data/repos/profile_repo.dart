import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/auth/data/models/login/user_role_response.dart';
import 'package:shopify/features/customer/profile/data/data_source/profile_data_source.dart';

class ProfileRepo {
  ProfileRepo(this._dataSource);
  final ProfileDataSource _dataSource;

  Future<ApiResult<UserRoleResponse>> getUserProfile() async {
    try {
      final response = await _dataSource.getUserInfo();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
