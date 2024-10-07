import 'package:flutter/material.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(Icons.edit, color: Colors.blue));
  }
}
