import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/core/common/widgets/custom_container_linear_admin.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/delete/delete_category_widget.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/update/update_category_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryItem extends StatelessWidget {
  const AddCategoryItem({
    required this.name,
    required this.image,
    required this.categoryId,
    super.key,
  });

  final String name;
  final String image;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: name,
                  theme: Theme.of(context).textTheme.headlineSmall!,
                ),
                const Spacer(),
                Row(
                  children: [
                    //Delete
                    DeleteCategoryWidget(
                      categoryId: categoryId,
                    ),
                    SizedBox(width: 20.h),
                    // BottomSheet Update
                    InkWell(
                      onTap: () {
                        _updateCategoryBottomSheet(context);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),

            // image
            Flexible(
              child: CachedNetworkImage(
                height: 90.h,
                width: 120.w,
                imageUrl: image,
                // fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCategoryBottomSheet(BuildContext context) {
    CustomBottomSheet.showModalBottomSheetContainer(
      context: context,
      widget: UpdateCategoryBottomWidget(
        imageUrl: image,
        categoryId: categoryId,
        categoryName: name,
      ),
    );
  }
}
