part of 'add_notification_bloc.dart';

@freezed
class AddNotificationEvent with _$AddNotificationEvent {
  const factory AddNotificationEvent.started() = _Started;
  const factory AddNotificationEvent.createNotification({
    required PushNotificationModel notificationModel,
  }) = CreateNotificationEvent;
  const factory AddNotificationEvent.deleteNotification({
    required PushNotificationModel notificationModel,
  }) = DeleteNotificationEvent;
}
