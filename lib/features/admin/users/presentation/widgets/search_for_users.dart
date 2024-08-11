import 'package:digital_boutique/core/common/widgets/custom_text_field.dart';
import 'package:digital_boutique/core/style/colors/colors_dark.dart';
import 'package:flutter/material.dart';

class SearchForUsers extends StatelessWidget {
  const SearchForUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Search for users',
      onChanged: (value) {
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search, color: ColorsDark.blueLight),
      ),
    );
  }
}
