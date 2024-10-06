import 'package:digital_boutique/core/common/loading/empty_screen.dart';
import 'package:digital_boutique/core/common/loading/loading_shimmer.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/create/create_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: Column(
        children: [
          // button create new category
          const CreateCategory(),

          // Category item list
          Expanded(
              child: RefreshIndicator(
            color: ColorsDark.blueLight,
            onRefresh: () async {
              context.read<GetAllAdminCategoriesBloc>().add(
                    const GetAllAdminCategoriesEvent.fetchAdminCategories(
                      isNotLoading: true,
                    ),
                  );
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                SliverToBoxAdapter(
                  child: BlocBuilder<GetAllAdminCategoriesBloc,
                      GetAllAdminCategoriesState>(
                    builder: (context, state) {
                      return state.when(
                        loading: builderWhenLoading,
                        success: builderWhenSuccess,
                        empty: () => const EmptyScreen(),
                        error: (error) => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }

  ListView builderWhenSuccess(CategoriesGetAllResponse dataList) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dataList.categoriesGetAllList.length,
      itemBuilder: (context, index) {
        final item = dataList.categoriesGetAllList[index];
        return AddCategoryItem(
          name: item.name ?? '',
          categoryId: item.id ?? '',
          image: item.image ?? '',
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
    );
  }

  ListView builderWhenLoading() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) =>
          LoadingShimmer(height: 130.h, borderRadius: 15),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
    );
  }
}
