import 'package:digital_boutique/core/style/app_images.dart';
import 'package:flutter/material.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Network'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.sizeOf(context).height * 0.5,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.noNetwork),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
