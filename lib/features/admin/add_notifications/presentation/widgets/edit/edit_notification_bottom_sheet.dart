import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/core/style/fonts/font_family_helper.dart';
import 'package:digital_boutique/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditNotificationBottomSheet extends StatefulWidget {
  const EditNotificationBottomSheet({
    super.key,
  });

  @override
  State<EditNotificationBottomSheet> createState() =>
      _EditNotificationBottomSheetState();
}

class _EditNotificationBottomSheetState
    extends State<EditNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productIdController.dispose();
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
            //Add Notifications Title
            Center(
              child: TextApp(
                text: 'Edit Notifications',
                theme: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
              ),
            ),
            SizedBox(height: 20.h),
            //Enter the Notification name title
            TextApp(
              text: 'Edit the Notification title',
              theme: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
            ),
            SizedBox(height: 20.h),
            // title for notification TextForm
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Title Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),

            //Enter the Notification name body
            TextApp(
              text: 'Edit the Notification body',
              theme: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
            ),
            SizedBox(height: 20.h),
            // Body for notification TextForm
            CustomTextField(
              controller: bodyController,
              hintText: 'Body',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Body Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            //Enter the Product Id
            TextApp(
              text: 'Edit the Product Id',
              theme: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
            ),
            SizedBox(height: 20.h),
            // productId for notification TextForm
            CustomTextField(
              controller: productIdController,
              keyboardType: TextInputType.number,
              validator: (value) {
                return null;
              },
              hintText: 'Product id',
            ),
            SizedBox(height: 20.h),
            //Button
            CustomButton(
              onPressed: () {
                _validAddNotification(context);
              },
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Edit a Notification',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }

  void _validAddNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {}
  }
}
