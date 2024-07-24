import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocConsumerUpdateCategory extends StatelessWidget {
  const BlocConsumerUpdateCategory({
    required this.nameCategoryController,
    required this.formKey,
    required this.imageUrl,
    required this.categoryId,
    super.key,
  });

  final TextEditingController nameCategoryController;
  final GlobalKey<FormState> formKey;
  final String imageUrl;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pop();
            ShowToast.showToastSuccessTop(
              message: '${nameCategoryController.text} Update Success',
              seconds: 2,
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(message: error);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsDark.blueDark,
                ),
              ),
            );
          },
          orElse: () {
            return CustomButton(
              onPressed: () {
                _validUpdateCategory(context);
              },
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Update category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }

  void _validUpdateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<UpdateCategoryBloc>().add(
            UpdateCategoryEvent.updateCategory(
              body: UpdateCategoryRequestBody(
                id: categoryId,
                image: context.read<UploadImageCubit>().getImageUrl.isEmpty
                    ? imageUrl
                    : context.read<UploadImageCubit>().getImageUrl,
                name: nameCategoryController.text.trim(),
              ),
            ),
          );
    }
  }
}
