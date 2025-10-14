import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/shared/custom_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.iconSize});
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Platform.isAndroid
              ? Icons.arrow_back
              : Icons.arrow_back_ios_new_rounded,
          size: iconSize,
        ),
      ),
    );
  }
}
