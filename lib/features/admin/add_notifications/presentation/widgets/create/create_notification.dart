import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/create/create_notification_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Notifications',
          theme: Theme.of(context).textTheme.headlineSmall!,
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: const CreateNotificationBottomSheet(),
            );
          },
          backgroundColor: ColorsDark.blueDark,
          lastRadius: 10,
          threeRadius: 10,
          text: 'Add',
          width: 90.w,
          height: 50.h,
        ),
      ],
    );
  }
}
