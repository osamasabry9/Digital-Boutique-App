import 'package:digital_boutique/features/customer/main/presentation/widgets/main_customer_app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainCustomerAppBar(),
    );
  }
}
