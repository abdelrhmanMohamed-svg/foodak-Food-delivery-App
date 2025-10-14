import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/screens/item_details_screen.dart';
import 'package:food_delivery/shared/fav_button.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.itemIndex});
  final int itemIndex;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ItemDetailsScreen(
                    itemIndex: widget.itemIndex,
                  ),
                ),
              )
              .then(
                (value) => setState(() {}),
              ),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.network(
                    food[widget.itemIndex].imgUrl,
                    fit: BoxFit.contain,
                    height: constraints.maxHeight * 0.53,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 2.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: FavButton(
                          itemIndex: widget.itemIndex,
                          iconSize: constraints.maxHeight * 0.13),
                    ),
                  )
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              SizedBox(
                width: constraints.maxWidth * 0.61,
                height: constraints.maxHeight * 0.2,
                child: FittedBox(
                  child: Text(
                    food[widget.itemIndex].name,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.18,
                width: constraints.maxWidth * 0.61,
                child: FittedBox(
                  child: Text(
                    "\$${food[widget.itemIndex].price}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 22, color: AppColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
