import 'package:flutter/material.dart';

class UpdateProductWidget extends StatelessWidget {
  const UpdateProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: const Icon(
        Icons.edit,
        color: Colors.green,
        size: 25,
      ),
    );
  }
}
