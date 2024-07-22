import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/create/create_category.dart';
import 'package:flutter/material.dart';
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
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              SliverToBoxAdapter(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const AddCategoryItem(
                    name: 'T-Shirts',
                    categoryId: '1',
                    image:
                        'https://www.cnet.com/a/img/resize/a55ce58ff6bcb46cc8ada3adf23193e7e7bbb338/hub/2019/10/09/c4f49e5f-459e-4c9f-bfc9-9e4e9d6256d5/nikon-z50-10.jpg?auto=webp&width=1200',
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: 5,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
