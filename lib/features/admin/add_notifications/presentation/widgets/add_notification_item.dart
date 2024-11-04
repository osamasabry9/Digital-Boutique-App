import 'package:digital_boutique/core/common/widgets/custom_container_linear_admin.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/fonts/font_family_helper.dart';
import 'package:digital_boutique/core/style/fonts/font_weight_helper.dart';
import 'package:digital_boutique/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/delete/delete_notification.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/edit/edit_notification.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/send/send_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem(
      {required this.notification, required this.index, super.key,});

  final AddNotificationModel notification;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            const Spacer(),
            //Title
            NotificationInfo(
              title: 'Title: ',
              body: notification.title,
            ),
            const Spacer(),
            //Body
            NotificationInfo(
              title: 'Body: ',
              body: notification.body,
            ),
            const Spacer(),
            //Create At
            NotificationInfo(
              title: 'Create At: ',
              body: notification.createAt.toLocal().toString().substring(0, 16),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DeleteNotification(notificationModel: notification),
                SizedBox(width: 40.w),
                EditNotification(notificationModel: notification),
                SizedBox(width: 40.w),
                SendNotification(
                  notificationModel: notification,
                  indexId: index,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 14.sp,
                color: Colors.white,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
        ),
        SizedBox(height: 8.w),
        Flexible(
          child: TextApp(
            text: body,
            theme: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 14.sp,
                  color: ColorsDark.blueLight,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                ),
          ),
        ),
      ],
    );
  }
}
