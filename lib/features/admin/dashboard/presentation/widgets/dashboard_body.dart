import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/constants/app_sizes.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/widgets/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        onRefresh: () async {
          context
              .read<ProductsNumberBloc>()
              .add(const ProductsNumberEvent.getProductsNumber());
          context
              .read<CategoriesNumberBloc>()
              .add(const CategoriesNumberEvent.getCategoriesNumber());
          context
              .read<UsersNumberBloc>()
              .add(const UsersNumberEvent.getUsersNumber());
        },
        child: ListView(
          children: [
            //Products
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      image: AppImages.adminProductsDrawer,
                      number: '',
                      title: 'Products',
                      isLoading: true,
                    );
                  },
                  success: (productNumber) {
                    return DashboardContainer(
                      image: AppImages.adminProductsDrawer,
                      number: productNumber,
                      title: 'Products',
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.red),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            //Categories
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      image: AppImages.adminCategoriesDrawer,
                      number: '',
                      title: 'Categories',
                      isLoading: true,
                    );
                  },
                  success: (categoryNumber) {
                    return DashboardContainer(
                      image: AppImages.adminCategoriesDrawer,
                      number: categoryNumber,
                      title: 'Categories',
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.red),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            //Users
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      image: AppImages.adminUsersDrawer,
                      number: '',
                      title: 'Users',
                      isLoading: true,
                    );
                  },
                  success: (categoryNumber) {
                    return DashboardContainer(
                      image: AppImages.adminUsersDrawer,
                      number: categoryNumber,
                      title: 'Users',
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.red),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
