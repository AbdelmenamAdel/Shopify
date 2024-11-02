import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/core/services/hive/hive_database.dart';
import 'package:shopify/features/admin/notifications/data/models/push_notification_model.dart';
// import 'package:shopify/features/admin/notifications/presentation/refactors/push_notification_body.dart';

part 'get_all_notification_admin_event.dart';
part 'get_all_notification_admin_state.dart';
part 'get_all_notification_admin_bloc.freezed.dart';

class GetAllNotificationAdminBloc
    extends Bloc<GetAllNotificationAdminEvent, GetAllNotificationAdminState> {
  GetAllNotificationAdminBloc()
      : super(const GetAllNotificationAdminState.loading()) {
    on<FetchAllNotificationAdminEvent>(_getAllNotification);
  }

  FutureOr<void> _getAllNotification(
    FetchAllNotificationAdminEvent event,
    Emitter<GetAllNotificationAdminState> emit,
  ) async {
    emit(const GetAllNotificationAdminState.loading());

    try {
      final list = HiveDatabase().notificationBox!.values.toList();

      if (list.isEmpty) {
        emit(const GetAllNotificationAdminState.empty());
      } else {
        emit(GetAllNotificationAdminState.success(notificationList: list));
      }
    } catch (e) {
      emit(GetAllNotificationAdminState.error(error: e.toString()));
    }
  }
}
