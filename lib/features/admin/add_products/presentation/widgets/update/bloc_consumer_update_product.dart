import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:digital_boutique/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocConsumerUpdateProduct extends StatelessWidget {
  const BlocConsumerUpdateProduct({
    required TextEditingController titleController, required this.fromKey, required this.categoryValueId, required TextEditingController descriptionController, required TextEditingController priceController, required this.product, super.key,
  }) : _titleController = titleController, _descriptionController = descriptionController, _priceController = priceController;

  final TextEditingController _titleController;
  final GlobalKey<FormState> fromKey;
  final String? categoryValueId;
  final TextEditingController _descriptionController;
  final TextEditingController _priceController;
final ProductGetAllModel product;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductBloc, UpdateProductState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.pop();
            ShowToast.showToastSuccessTop(
              message: '${_titleController.text} Update Success',
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
                _validUpdateProduct(context);
              },
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Update Product',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }

  void _validUpdateProduct(BuildContext context) {
    if (fromKey.currentState!.validate()) {
      context.read<UpdateProductBloc>().add(
            UpdateProductEvent.updateProduct(
              body: UpdateProductRequestBody(
                categoryId:
                    double.parse(categoryValueId!),
                title: _titleController.text.trim(),
                description:
                    _descriptionController.text.trim(),
                price: double.parse(
                    _priceController.text.trim()),
                imageList: context
                        .read<UploadImageCubit>()
                        .imageUpdateList
                        .isEmpty
                    ? product.images!
                    : context
                        .read<UploadImageCubit>()
                        .imageUpdateList,
                productId:product.id!,
              ),
            ),
          );
    }
  }
}
