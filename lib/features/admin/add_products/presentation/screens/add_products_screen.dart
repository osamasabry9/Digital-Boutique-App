import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/add_products_body.dart';
import 'package:flutter/material.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Add Products',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
      body: AddProductsBody(),
    );
  }
}
