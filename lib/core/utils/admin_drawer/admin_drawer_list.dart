import 'package:digital_boutique/core/common/dialogs/custom_dialogs.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/utils/admin_drawer/drawer_item_model.dart';
import 'package:digital_boutique/core/utils/helpers/app_logout.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/screens/add_categories_screen.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/screens/add_notifications_screen.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/screens/add_products_screen.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:digital_boutique/features/admin/users/presentation/screens/users_screen.dart';
import 'package:flutter/material.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: const Icon(Icons.dashboard, color: Colors.white),
      title: TextApp(
        text: 'DashBoard',
        theme: Theme.of(context).textTheme.headlineSmall!,
      ),
      page: const DashboardScreen(),
    ),
    //Categories
    DrawerItemModel(
      icon: const Icon(Icons.category_outlined, color: Colors.white),
      title: TextApp(
        text: 'Categories',
        theme: Theme.of(context).textTheme.headlineSmall!,
      ),
      page: const AddCategoriesScreen(),
    ),
    //Product
    DrawerItemModel(
      icon: const Icon(Icons.production_quantity_limits, color: Colors.white),
      title: TextApp(
        text: 'Products',
        theme: Theme.of(context).textTheme.headlineSmall!,
      ),
      page: const AddProductsScreen(),
    ),
    //Users
    DrawerItemModel(
      icon: const Icon(Icons.people_alt_rounded, color: Colors.white),
      title: TextApp(
        text: 'Users',
        theme: Theme.of(context).textTheme.headlineSmall!,
      ),
      page: const UsersScreen(),
    ),
    //Notifications
    DrawerItemModel(
      icon: const Icon(Icons.notifications_active, color: Colors.white),
      title: TextApp(
        text: 'Notifications',
        theme: Theme.of(context).textTheme.headlineSmall!,
      ),
      page: const AddNotificationsScreen(),
    ),
    //LogOut
    DrawerItemModel(
      icon: const Icon(Icons.exit_to_app, color: Colors.white),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,
            onPressed: () async {
              await AppLogout().logout();
            },
          );
        },
        child: Text(
          'Logout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      page: const UsersScreen(),
    ),
  ];
}
