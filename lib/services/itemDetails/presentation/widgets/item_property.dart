import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';

class ItemProperty extends StatelessWidget {
  const ItemProperty(
      {super.key, required this.propertyName, required this.value});
  final String propertyName;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          propertyName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.grey,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
