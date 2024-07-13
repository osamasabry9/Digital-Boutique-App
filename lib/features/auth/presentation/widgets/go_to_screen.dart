import 'package:digital_boutique/core/common/animations/animate_do.dart';
import 'package:digital_boutique/core/common/widgets/text_app.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class GoToScreen extends StatelessWidget {
  const GoToScreen({
    required this.routeName,
    required this.title,
    super.key,
  });
  final String routeName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: TextButton(
        onPressed: () {
          context.pushReplacementNamed(routeName);
        },
        child: TextApp(
          text: context.translate(title),
          theme: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: context.color.bluePinkLight,
              ),
        ),
      ),
    );
  }
}
