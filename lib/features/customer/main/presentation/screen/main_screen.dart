import 'package:digital_boutique/features/customer/main/presentation/widgets/bottom_nav_bar.dart';
import 'package:digital_boutique/features/customer/main/presentation/widgets/main_customer_app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainCustomerAppBar(),
      body: Column(
        children: [
          Expanded(child: Center(child: Text('Main Screen'))),
          BottomNavBar(),
        ],
      ),
    );
  }
}
