import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendNotification extends StatelessWidget {
  const SendNotification({
    required this.notificationModel,
    required this.indexId,
    super.key,
  });
  final AddNotificationModel notificationModel;
  final int indexId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: 'Your notifications have been send successfully',
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(message: error);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (indexId) {
            if (indexId == this.indexId) {
              return SizedBox(
                height: 25.h,
                width: 25.w,
                child: const Center(
                  child: CircularProgressIndicator(color: ColorsDark.white),
                ),
              );
            } else {
              return const Icon(Icons.send, color: Colors.green);
            }
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<SendNotificationBloc>().add(
                      SendNotificationEvent.sendNotification(
                        title: notificationModel.title,
                        body: notificationModel.body,
                        productId: notificationModel.productId,
                        indexId: indexId,
                      ),
                    );
              },
              child: const Icon(Icons.send, color: Colors.green),
            );
          },
        );
      },
    );
  }
}
