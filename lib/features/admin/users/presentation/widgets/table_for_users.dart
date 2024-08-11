import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/users/presentation/widgets/table_cell_item_widget.dart';
import 'package:digital_boutique/features/admin/users/presentation/widgets/table_cell_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsDark.blueLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(110.w),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(
            color: ColorsDark.blueDark,
          ),
          children: [
            //Name
            TableCellTitleWidget(title: 'Name', icon: Icons.person),
            //Email
            TableCellTitleWidget(title: 'Email', icon: Icons.email_outlined),
            //Delete
            TableCellTitleWidget(title: 'Delete', icon: Icons.delete_forever),
          ],
        ),
        ...List.generate(
          4,
          (index) => const TableRow(
            children: [
              //Name
              TableCellItemWidget(text: 'Name'),
              //Email
              TableCellItemWidget(text: 'Email'),
              //Delete
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Icon(Icons.delete, color: Colors.red, size: 25),
              ),
            ],
          ),
        )
      ],
    );
  }
}
