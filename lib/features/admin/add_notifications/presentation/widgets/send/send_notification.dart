import 'package:flutter/material.dart';

class SendNotification extends StatelessWidget {
  const SendNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(Icons.send, color: Colors.green),
    );
  }
}
