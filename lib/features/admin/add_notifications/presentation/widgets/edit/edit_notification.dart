import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/widgets/edit/edit_notification_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget: const EditNotificationBottomSheet(),
        );
      },
      child: const Icon(Icons.edit, color: Colors.blue),
    );
  }
}
