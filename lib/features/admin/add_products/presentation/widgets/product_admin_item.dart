import 'package:cached_network_image/cached_network_image.dart';
import 'package:digital_boutique/core/common/widgets/custom_container_linear_admin.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/extensions/string_exetension.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/delete/delete_product_widget.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/update/update_button_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem({
    required this.product,
    super.key,
  });

  final ProductGetAllModel product;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:product.images!.first.imageProductFormate(),
                  height: 200.h,
                  width: 120.w,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red, size: 50),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // Product Title
            TextApp(
              text: product.title ?? '',
              theme: Theme.of(context).textTheme.titleMedium!,
              maxLines: 1,
            ),
            SizedBox(height: 5.h),
            // Product Title
            TextApp(
              text: product.category!.name ?? '',
              theme: Theme.of(context).textTheme.labelMedium!,
              maxLines: 1,
            ),
            SizedBox(height: 5.h),
            // Product Price
            TextApp(
              text: '\$ ${product.price}',
              theme: Theme.of(context).textTheme.labelLarge!,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Delete Button
                DeleteProductWidget(productId: product.id ?? ''),
                // Update Button
                UpdateButtonProductWidget(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
