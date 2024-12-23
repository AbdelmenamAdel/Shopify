import 'package:shopify/core/services/graphql/api_result.dart';
import 'package:shopify/features/admin/notifications/data/models/data_source/add_notificaion_data_source.dart';

class AddNotificationRepo {
  const AddNotificationRepo(this._dataSource);

  final AddNotificationDataSource _dataSource;

  // send notification to all users
  Future<ApiResult<void>> sendNotifications({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await _dataSource.sendNotifications(
        body: body,
        productId: productId,
        title: title,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  // add Notifications to all users in firebase data base

  Future<void> addNotificationsToAllUsersFirebase({
    required String body,
    required String title,
    required int productId,
  }) async {
    await _dataSource.addNotificationsToAllUsersFirebase(
      body: body,
      title: title,
      productId: productId,
    );
  }
}
