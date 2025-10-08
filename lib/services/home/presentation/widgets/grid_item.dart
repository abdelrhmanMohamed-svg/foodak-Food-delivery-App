import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';

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

    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  food[widget.itemIndex].imgUrl,
                  fit: BoxFit.contain,
                  height: size.height * 0.15,
                  width: size.width,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      food[widget.itemIndex] = food[widget.itemIndex].copyWith(
                          isFavorite: !food[widget.itemIndex].isFavorite);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                          food[widget.itemIndex].isFavorite
                              ? Icons.favorite
                              :  Icons.favorite_border,
                          color: AppColors.primary, size: 25),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              food[widget.itemIndex].name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: size.height * 0.001),
            Text(
              "\$${food[widget.itemIndex].price}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 22, color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}
