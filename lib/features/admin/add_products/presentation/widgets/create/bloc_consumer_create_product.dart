import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocConsumerCreateProduct extends StatelessWidget {
  const BlocConsumerCreateProduct({
    required TextEditingController titleController,
    required this.fromKey,
    required this.categoryValueName,
    required TextEditingController descriptionController,
    required TextEditingController priceController,
    required this.categoryValueId,
    super.key,
  })  : _titleController = titleController,
        _descriptionController = descriptionController,
        _priceController = priceController;

  final TextEditingController _titleController;
  final GlobalKey<FormState> fromKey;
  final String? categoryValueName;
  final TextEditingController _descriptionController;
  final TextEditingController _priceController;
  final double? categoryValueId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProductBloc, CreateProductState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pop();

            ShowToast.showToastSuccessTop(
              message: '${_titleController.text} Created Success',
              seconds: 2,
            );
          },
          error: (errorMessage) {
            ShowToast.showToastErrorTop(message: errorMessage);
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
                color: ColorsDark.blueDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsDark.white,
                ),
              ),
            );
          },
          orElse: () {
            return CustomButton(
              onPressed: () {
                final indexEmptyImage = context
                    .read<UploadImageCubit>()
                    .imageList
                    .indexWhere((e) => e.isNotEmpty);

                if (fromKey.currentState!.validate() ||
                    indexEmptyImage == -1 ||
                    categoryValueName == null) {
                  if (indexEmptyImage == -1) {
                    ShowToast.showToastErrorTop(
                      message: context.translate(LangKeys.validPickImage),
                    );
                  } else if (categoryValueName == null) {
                    ShowToast.showToastErrorTop(
                      message: 'Please select your category',
                    );
                  } else {
                    // create new product

                    context.read<CreateProductBloc>().add(
                          CreateProductEvent.createProduct(
                            body: CreateProductRequestBody(
                              title: _titleController.text.trim(),
                              description: _descriptionController.text.trim(),
                              price: double.parse(_priceController.text.trim()),
                              imageList:
                                  context.read<UploadImageCubit>().imageList,
                              categoryId: categoryValueId ?? 0,
                            ),
                          ),
                        );
                  }
                }
              },
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Create Product',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }
}
