import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/users/data/data_source/users_data_source.dart';
import 'package:shopify/features/admin/users/data/models/get_all_users_response.dart';

class UsersRepo {
  UsersRepo(this._dataSource);

  final UsersDataSource _dataSource;

  Future<ApiResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final response = await _dataSource.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }

  Future<ApiResult<void>> deleteUser({required String userId}) async {
    try {
      final response = await _dataSource.deleteUser(userId: userId);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error');
    }
  }
}
