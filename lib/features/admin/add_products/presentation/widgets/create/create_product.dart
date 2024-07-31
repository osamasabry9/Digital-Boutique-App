import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_product_bottom_sheet.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Products',
          theme: Theme.of(context).textTheme.headlineSmall!,
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt<CreateProductBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => getIt<UploadImageCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => getIt<GetAllAdminCategoriesBloc>()
                      ..add(
                        const GetAllAdminCategoriesEvent.fetchAdminCategories(
                          isNotLoading: false,
                        ),
                      ),
                  ),
                ],
                child: const CreateProductBottomSheet(),
              ),
              whenComplete: () {
                context.read<GetAllAdminProductsBloc>().add(
                      const GetAllAdminProductsEvent.getAllProducts(
                        isNotLoading: false,
                      ),
                    );
              },
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
