import 'package:digital_boutique/core/common/widgets/custom_container_linear_admin.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/fonts/font_family_helper.dart';
import 'package:digital_boutique/core/style/fonts/font_weight_helper.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/delete/delete_notification.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/edit/edit_notification.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/send/send_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({super.key});

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
            const NotificationInfo(
              title: 'Title: ',
              body: ' title',
            ),
            const Spacer(),
            //Body
            const NotificationInfo(
              title: 'Body: ',
              body: ' body',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Create At: ',
              body: ' create at',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DeleteNotification(),
                SizedBox(width: 40.w),
                const EditNotification(),
                SizedBox(width: 40.w),
                const SendNotification(),
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
                  )),
        ),
      ],
    );
  }
}
