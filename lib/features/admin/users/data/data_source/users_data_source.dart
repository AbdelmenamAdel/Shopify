import 'package:shopify/core/services/graphql/admin/users_queries.dart';
import 'package:shopify/core/services/graphql/api_service.dart';
import 'package:shopify/features/admin/users/data/models/get_all_users_response.dart';

class UsersDataSource {
  UsersDataSource(this._qraphql);

  final ApiService _qraphql;

  Future<GetAllUsersResponse> getAllUsers() async {
    final response =
        await _qraphql.getAllUsers(UsersQueries().getAllUsersMapQuery());
    return response;
  }

  Future<void> deleteUser({required String userId}) async {
    await _qraphql
        .deleteUser(UsersQueries().deleteUserMapQuery(userId: userId));
  }
}
