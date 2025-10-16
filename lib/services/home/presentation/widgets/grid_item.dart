import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/core/ui_models/item_details_args.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/screens/item_details_screen.dart';
import 'package:food_delivery/shared/fav_button.dart';

class GridItem extends StatefulWidget {
  final FoodItem item;
  const GridItem({
    super.key,
    required this.item,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: AppColors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.55,
                    width: double.infinity,
                    child: Image.network(
                      widget.item.imgUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: FavButton(
                        itemIndex: food.indexOf(widget.item),
                        iconSize: constraints.maxHeight * 0.15),
                  )
                ],
              ),
              Expanded(
                child: Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                "\$${widget.item.price}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
