import 'package:flutter/material.dart';

class DeleteProductWidget extends StatelessWidget {
  const DeleteProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
        size: 25,
      ),
    );
  }
}
