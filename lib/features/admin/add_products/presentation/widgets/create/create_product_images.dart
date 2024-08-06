import 'package:digital_boutique/core/common/toast/show_toast.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProductImages extends StatelessWidget {
  const CreateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ShowToast.showToastSuccessTop(
                  message: context.translate(LangKeys.imageUploaded),
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
              loadingList: (indexId) {
                if (indexId == index) {
                  return Container(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return SleetedYourProductImage(
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return SleetedYourProductImage(
                  index: index,
                  onTap: () {
                    context
                        .read<UploadImageCubit>()
                        .uploadImageList(indexId: index);
                  },
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8.h),
    );
  }
}

class SleetedYourProductImage extends StatelessWidget {
  const SleetedYourProductImage({
    required this.index,
    required this.onTap,
    super.key,
  });

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imageList[index].isNotEmpty
        ? Container(
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    context.read<UploadImageCubit>().imageList[index]),
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          );
  }
}
