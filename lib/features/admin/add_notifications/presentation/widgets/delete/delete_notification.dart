import 'package:flutter/material.dart';

class DeleteNotification extends StatelessWidget {
  const DeleteNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(Icons.delete, color: Colors.red),
    );
  }
}
