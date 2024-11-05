import 'package:digital_boutique/core/enums/nav_bar_enum.dart';
import 'package:digital_boutique/features/customer/categories/presentation/screen/categories_screen.dart';
import 'package:digital_boutique/features/customer/favorite/presentation/screen/favorite_screen.dart';
import 'package:digital_boutique/features/customer/home/presentation/screen/home_screen.dart';
import 'package:digital_boutique/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:digital_boutique/features/customer/main/presentation/widgets/bottom_nav_bar.dart';
import 'package:digital_boutique/features/customer/main/presentation/widgets/main_customer_app_bar.dart';
import 'package:digital_boutique/features/customer/profile/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomerAppBar(),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                final cubit = context.read<MainCubit>();
                switch (cubit.navBarEnum) {
                  case NavBarEnum.home:
                    return const HomeScreen();
                  case NavBarEnum.categories:
                    return const CategoriesScreen();
                  case NavBarEnum.favorites:
                    return const FavoriteScreen();
                  case NavBarEnum.profile:
                    return const ProfileScreen();
                }
              },
            ),
          ),
          const BottomNavBar(),
        ],
      ),
    );
  }
}
