import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:flutter/material.dart';

class TableCellItemWidget extends StatelessWidget {
  const TableCellItemWidget({
    required this.text, super.key,
  });
  final String text ;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextApp(
          text: text,
          theme: Theme.of(context).textTheme.labelLarge!,
        ),
      ),
    );
  }
}
