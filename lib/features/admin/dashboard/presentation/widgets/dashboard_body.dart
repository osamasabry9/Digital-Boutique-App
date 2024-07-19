import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/widgets/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingH,
        vertical: AppSizes.paddingV,
      ),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            // Products
            const DashboardContainer(
              image: AppImages.adminProductsDrawer,
              number: '0',
              title: 'Products',
              isLoading: false,
            ),
            SizedBox(height: 20.h),
            // Categories
            const DashboardContainer(
              image: AppImages.adminCategoriesDrawer,
              number: '0',
              title: 'Categories',
              isLoading: false,
            ),
            SizedBox(height: 20.h),
            // Users
            const DashboardContainer(
              image: AppImages.adminUsersDrawer,
              number: '0',
              title: 'Users',
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}
