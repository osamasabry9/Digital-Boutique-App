import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';

import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/category_upload_image.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/create/add_photo_section.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/create/bloc_consumer_create_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategoryBottomSheetWidget extends StatefulWidget {
  const CreateCategoryBottomSheetWidget({super.key});

  @override
  State<CreateCategoryBottomSheetWidget> createState() =>
      _CreateCategoryBottomSheetWidgetState();
}

class _CreateCategoryBottomSheetWidgetState
    extends State<CreateCategoryBottomSheetWidget> {
  TextEditingController nameCategoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Create Category Title
            Center(
              child: TextApp(
                text: 'Create Category',
                theme: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
            ),
            SizedBox(height: 20.h),

            // Add a photo title
            const AddPhotoSection(),
            SizedBox(height: 10.h),
            //Selected Image  and upload image
            const CategoryUploadImage(),
            SizedBox(height: 20.h),
            //Enter the category name title
            TextApp(
              text: 'Enter the Category Name',
              theme: Theme.of(context).textTheme.titleLarge!,
            ),
            SizedBox(height: 10.h),
            // Name for category TextForm
            CustomTextField(
              controller: nameCategoryController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Category Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Category Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            //Create a new category Button
            BlocConsumerCreateCategory(
              nameCategoryController: nameCategoryController,
              formKey: formKey,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
