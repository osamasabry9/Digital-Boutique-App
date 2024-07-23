import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPhotoSection extends StatelessWidget {
  const AddPhotoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Add a photo',
          theme: Theme.of(context).textTheme.titleLarge!,
        ),
        //Remove Image
        BlocBuilder<UploadImageCubit, UploadImageState>(
          builder: (context, state) {
            if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
              return const SizedBox.shrink();
            }
            return CustomButton(
              onPressed: () {
                context.read<UploadImageCubit>().removeImage();
              },
              backgroundColor: Colors.red,
              lastRadius: 10,
              threeRadius: 10,
              text: 'Remove',
              width: 120.w,
              height: 35.h,
            );
          },
        ),
      ],
    );
  }
}
