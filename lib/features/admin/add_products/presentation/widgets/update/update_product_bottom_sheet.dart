import 'package:digital_boutique/core/common/widgets/custom_button.dart';
import 'package:digital_boutique/core/common/widgets/custom_drop_down.dart';
import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/update/update_product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({
    required this.imageList,
    required this.categoryName,
    required this.title,
    required this.price,
    required this.description,
    required this.productId,
    required this.categoryId,
    super.key,
  });

  final List<String> imageList;
  final String categoryName;
  final String title;
  final String price;
  final String description;
  final String productId;
  final String categoryId;

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryValueName;
  String? categoryValueId;

  @override
  void initState() {
    super.initState();

    categoryValueName = widget.categoryName;
    categoryValueId = widget.categoryId;
    _titleController.text = widget.title;
    _priceController.text = widget.price;
    _descriptionController.text = widget.description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Create Category Title
            Center(
              child: TextApp(
                text: 'Update Product',
                theme: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 20.sp,
                    ),
              ),
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Update a photos',
              theme: Theme.of(context).textTheme.titleLarge!,
            ),
            SizedBox(height: 15.h),
            //Update Image Widget
            UpdateProductImages(
              imageList: widget.imageList,
            ),
            SizedBox(height: 15.h),
            TextApp(
              text: 'Title',
              theme: Theme.of(context).textTheme.titleLarge!,
            ),
            SizedBox(height: 15.h),
            // Title
            CustomTextField(
              controller: _titleController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Title',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Product Title';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            TextApp(
              text: 'Price',
              theme: Theme.of(context).textTheme.titleLarge!,
            ),
            SizedBox(height: 15.h),
            // Price
            CustomTextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              hintText: 'Price',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Selected Your Product Price';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            TextApp(
              text: 'Description',
              theme: Theme.of(context).textTheme.titleLarge!,
            ),
            SizedBox(height: 15.h),
            //Description
            CustomTextField(
              controller: _descriptionController,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              hintText: 'Description',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Product description';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            TextApp(
              text: 'Category',
              theme: Theme.of(context).textTheme.titleLarge!,
            ),
            SizedBox(height: 15.h),
            //Category Dropdown
            CustomCreateDropDown(
              items: [],
              hintText: 'Category',
              onChanged: (value) {},
              value: categoryValueName,
            ),
          
            CustomButton(
              onPressed: () {},
              backgroundColor: ColorsDark.white,
              lastRadius: 20,
              threeRadius: 20,
              textColor: ColorsDark.blueDark,
              text: 'Update Product',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            ),
          ]),
        ),
      ),
    );
  }
}
