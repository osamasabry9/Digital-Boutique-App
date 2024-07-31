import 'package:digital_boutique/core/common/widgets/custom_drop_down.dart';
import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/create/bloc_consumer_create_product.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/create/create_product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryValueName;
  double? categoryValueId;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Create Category Title
              Center(
                child: TextApp(
                  text: 'Create Product',
                  theme: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 20.sp,
                      ),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'Upload a photos',
                theme: Theme.of(context).textTheme.titleLarge!,
              ),
              SizedBox(height: 15.h),
              //Update Image Widget
              const CreateProductImages(),
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
              // Category Drop Down
              BlocBuilder<GetAllAdminCategoriesBloc,
                  GetAllAdminCategoriesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (category) {
                      return CustomCreateDropDown(
                        hintText: 'Select a Category',
                        items: category.categoryDropdownList,
                        onChanged: (value) {
                          setState(() {
                            categoryValueName = value;

                            final categoryIdString = category
                                .categoriesGetAllList
                                .firstWhere((e) => e.name == value)
                                .id!;
                            categoryValueId = double.parse(categoryIdString);
                          });
                        },
                        value: categoryValueName,
                      );
                    },
                    orElse: () {
                      return CustomCreateDropDown(
                        hintText: 'Select a Category',
                        items: const [''],
                        onChanged: (value) {},
                        value: '',
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 15.h),

              BlocConsumerCreateProduct(
                titleController: _titleController,
                fromKey: fromKey,
                categoryValueName: categoryValueName,
                descriptionController: _descriptionController,
                priceController: _priceController,
                categoryValueId: categoryValueId,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
