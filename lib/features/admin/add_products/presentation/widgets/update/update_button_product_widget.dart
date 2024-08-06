import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/update/update_product_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButtonProductWidget extends StatelessWidget {
  const UpdateButtonProductWidget({
    required this.product,
    super.key,
  });

  final ProductGetAllModel product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<UpdateProductBloc>()),
              BlocProvider(create: (context) => getIt<UploadImageCubit>()),
              BlocProvider(
                create: (context) => getIt<GetAllAdminCategoriesBloc>()
                  ..add(
                    const GetAllAdminCategoriesEvent.fetchAdminCategories(
                      isNotLoading: false,
                    ),
                  ),
              ),
            ],
            child: UpdateProductBottomSheet(product: product),
          ),
        );
      },
      icon: const Icon(
        Icons.edit,
        color: Colors.green,
        size: 25,
      ),
    );
  }
}
