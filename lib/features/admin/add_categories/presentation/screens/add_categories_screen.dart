import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/common/widgets/admin_app_bar.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/widgets/add_categories_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllAdminCategoriesBloc>()
            ..add(
              const GetAllAdminCategoriesEvent.fetchAdminCategories(
                  isNotLoading: true,),
            ),
        ),
        BlocProvider(create: (context) => getIt<DeleteCategoryBloc>()),
      ],
      child: const Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: AdminAppBar(
          title: 'Add Categories',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: AddCategoriesBody(),
      ),
    );
  }
}
