import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocConsumerCreateCategory extends StatelessWidget {
  const BlocConsumerCreateCategory({
    required this.nameCategoryController,
    required this.formKey,
    super.key,
  });

  final TextEditingController nameCategoryController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pop();
            ShowToast.showToastSuccessTop(
              message: '${nameCategoryController.text} Created Success',
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
                _validCreateCategory(context);
              },
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Create a new category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }

  void _validCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else {
        // send category
        context.read<CreateCategoryBloc>().add(
              CreateCategoryEvent.createCategory(
                body: CreateCategoryRequestBody(
                  image: context.read<UploadImageCubit>().getImageUrl,
                  name: nameCategoryController.text.trim(),
                ),
              ),
            );
      }
    }
  }
}
