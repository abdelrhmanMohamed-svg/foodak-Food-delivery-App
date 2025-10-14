import 'package:flutter/material.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/widgets/item_counter.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({super.key, required this.itemIndex});
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food[itemIndex].name,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              'Bufallo Burger',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.grey.shade600),
            )
          ],
        ),
        const Spacer(),
        ItemCounter(),
      ],
    );
  }
}
