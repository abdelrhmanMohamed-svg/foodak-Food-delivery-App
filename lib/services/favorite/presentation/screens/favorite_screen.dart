import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/core/ui_models/item_details_args.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/screens/item_details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteList = food
        .where(
          (foodItem) => foodItem.isFavorite == true,
        )
        .toList();
    if (favoriteList.isEmpty) {
      return Center(
        child: Column(
          children: [
            if (isLandScape) SizedBox(height: size.height * 0.06),
            Image.asset(
              "assets/images/favorite/empty_state.png",
              height: isLandScape ? size.height * 0.32 : size.height * 0.4,
              width: isLandScape ? size.width * 0.2 : size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: isLandScape ? size.height * 0.05 : null),
            Text("There is no favorite items yet",
                style: Theme.of(context).textTheme.titleLarge)
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: isLandScape ? size.height * 0.3 : size.height * 0.14,
          child: InkWell(
            onTap: () {
              final targetItem = favoriteList[index];
              final targetIndex = food.indexOf(targetItem);
              Navigator.of(context)
                  .pushNamed(ItemDetailsScreen.routeName,
                      arguments: ItemDetailsArgs(itemIndex: targetIndex))
                  .then(
                    (value) => setState(() {}),
                  );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: LayoutBuilder(
                  builder: (context, constraints) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        Image.network(
                          favoriteList[index].imgUrl,
                          width: constraints.maxWidth * 0.25,
                          height: constraints.maxHeight * 0.8,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: constraints.maxWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * 0.26,
                              child: FittedBox(
                                child: Text(
                                  favoriteList[index].name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.05),
                            SizedBox(
                              height: constraints.maxHeight * 0.26,
                              child: FittedBox(
                                child: Text(
                                  "\$${favoriteList[index].price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: AppColors.primary),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              final targetItem = favoriteList[index];
                              final targetIndex = food.indexOf(targetItem);
                              setState(() {
                                food[targetIndex] = food[targetIndex]
                                    .copyWith(isFavorite: false);
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: AppColors.primary,
                              size: constraints.maxHeight * 0.24,
                            ))
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
