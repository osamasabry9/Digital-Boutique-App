import 'package:digital_boutique/core/common/loading/loading_shimmer.dart';
import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({ this.image, super.key});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageUploaded),
            );
          },
          removeImage: (removeImage) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageRemoved),
            );
          },
          error: (errorMessage) {
            ShowToast.showToastErrorTop(
              message: errorMessage,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () {
            return LoadingShimmer(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              borderRadius: 15,
            );
          },
          orElse: () {
            if (cubit.getImageUrl.isNotEmpty) {
              return Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(cubit.getImageUrl),
                  ),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  context.read<UploadImageCubit>().uploadImage();
                },
                child: Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    image: image == null
                        ? null
                        : DecorationImage(
                            image: NetworkImage(image!),
                          ),
                  ),
                  child: image == null
                      ? const Icon(
                          Icons.add_a_photo_outlined,
                          size: 50,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            }
          },
        );
      },
    );
  }
}
