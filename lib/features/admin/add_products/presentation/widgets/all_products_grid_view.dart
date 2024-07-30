import 'package:digital_boutique/features/admin/add_products/presentation/widgets/product_admin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //Number of columns
                  crossAxisSpacing: 8, // Spacing between columns
                  mainAxisSpacing: 15, //Spacing between rows
                  childAspectRatio: 165 / 250,
                ),
                itemBuilder: (context, index) {
                  return const ProductAdminItem(
                    imageUrl:
                        'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
                    title: 'Product Title',
                    categoryName: 'Category Name',
                    price: '1500',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
