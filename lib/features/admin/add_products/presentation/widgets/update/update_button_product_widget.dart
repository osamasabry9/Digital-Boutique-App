import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/update/update_product_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateButtonProductWidget extends StatelessWidget {
  const UpdateButtonProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget:  const UpdateProductBottomSheet(
            
          ),
        );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.green,
        size: 25,
      ),
    );
  }
}
