import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/add_categories_body.dart';
import 'package:flutter/material.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Add Categories',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
      body: AddCategoriesBody(),
    );
  }
}
