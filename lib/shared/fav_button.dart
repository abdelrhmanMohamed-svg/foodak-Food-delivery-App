import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/shared/custom_button.dart';

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
    required this.itemIndex,
    required this.iconSize,
  });
  final int itemIndex;

  final double iconSize;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        child: InkWell(
      onTap: () {
        setState(() {
          food[widget.itemIndex] = food[widget.itemIndex]
              .copyWith(isFavorite: !food[widget.itemIndex].isFavorite);
        });
      },
      child: Icon(
          food[widget.itemIndex].isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: AppColors.primary,
          size: widget.iconSize),
    ));
  }
}
