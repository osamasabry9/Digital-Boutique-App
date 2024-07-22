import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/create/create_category_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
          theme: Theme.of(context).textTheme.headlineSmall!,
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: const CreateCategoryBottomSheetWidget(),
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
