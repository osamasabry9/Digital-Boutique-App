import 'package:digital_boutique/features/admin/add_products/presentation/widgets/all_products_grid_view.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/create/create_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: const Column(
        children: [
          // button create new product
          CreateProduct(),

          // product item list
          AllProductsGridView(),
        ],
      ),
    );
  }
}
