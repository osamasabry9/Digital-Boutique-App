import 'dart:async';
import 'package:digital_boutique/features/admin/add_notifications/data/repos/add_notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_notification_event.dart';
part 'send_notification_state.dart';
part 'send_notification_bloc.freezed.dart';

class SendNotificationBloc
    extends Bloc<SendNotificationEvent, SendNotificationState> {
  SendNotificationBloc(this._repo)
      : super(const SendNotificationState.initial()) {
    on<NewSendNotificationEvent>(_sendNewNotification);
  }

  final AddNotificationRepo _repo;
  FutureOr<void> _sendNewNotification(
    NewSendNotificationEvent event,
    Emitter<SendNotificationState> emit,
  ) async {
    emit(SendNotificationState.loading(indexId: event.indexId));
    final result = await _repo.sendNotifications(
      title: event.title,
      body: event.body,
      productId: event.productId,
    );

    result.when(
      success: (_) {
        emit(const SendNotificationState.success());
      },
      failure: (error) {
        emit(SendNotificationState.error(error: error));
      },
    );
  }
}
