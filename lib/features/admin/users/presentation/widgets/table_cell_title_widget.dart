import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget({
    required this.title,
    required this.icon,
    super.key,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            SizedBox(width: 5.w),
            TextApp(
              text: title,
              theme: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
