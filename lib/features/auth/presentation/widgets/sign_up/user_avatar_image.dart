import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageUploaded),
                seconds: 2,
              );
            },
            removeImage: (removeImage) {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageRemoved),
                seconds: 2,
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
          return state.maybeWhen(
            loading: () => whenLoadingWidget(context),
            success: () {
              return Stack(
                children: [
                  CircleAvatar(
                    radius: 38.r,
                    backgroundImage: NetworkImage(
                            context.read<UploadImageCubit>().getImageUrl,)
                        as ImageProvider,
                    backgroundColor: Colors.grey.withOpacity(0.1),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: IconButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              );
            },
            orElse: () {
              return CircleAvatar(
                radius: 38.r,
                backgroundImage: const AssetImage(AppImages.user),
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),

                    // take image from gallery
                    IconButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().uploadImage();
                      },
                      icon: const Icon(Icons.add_a_photo, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  CircleAvatar whenLoadingWidget(BuildContext context) {
    return CircleAvatar(
      radius: 38,
      backgroundImage: const AssetImage(AppImages.user),
      child: Center(
        child: CircularProgressIndicator(
          color: context.color.mainColor,
        ),
      ),
    );
  }
}
