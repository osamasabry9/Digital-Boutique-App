import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/widgets/add_products_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllAdminProductsBloc>()
            ..add(
              const GetAllAdminProductsEvent.getAllProducts(isNotLoading: true),
            ),
        ),
        BlocProvider(create: (context) => getIt<DeleteProductBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Add Products',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddProductsBody(),
      ),
    );
  }
}
