import 'package:flutter/material.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/shared/custom_back_button.dart';
import 'package:food_delivery/shared/fav_button.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key, required this.itemIndex});
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.6,
      width: size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(iconSize: size.height * 0.035),
                    FavButton(
                        itemIndex: itemIndex, iconSize: size.height * 0.035),
                  ],
                ),
                Image.network(
                  food[itemIndex].imgUrl,
                  height: size.height * 0.46,
                  width: size.width * 0.9,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
