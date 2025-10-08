import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = food
        .where(
          (foodItem) => foodItem.isFavorite == true,
        )
        .toList();
    if (favoriteList.isEmpty) {
      return Column(
        children: [
          Image.asset("assets/images/favorite/empty_state.png"),
          Text("There is no favorite items yet",
              style: Theme.of(context).textTheme.titleLarge)
        ],
      );
    }
    return ListView.builder(
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Image.network(
                  favoriteList[index].imgUrl,
                  height: 130,
                  width: 130,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favoriteList[index].name,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 7),
                    Text(
                      "\$${favoriteList[index].price}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.primary),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      final targetItem = favoriteList[index];
                      final targetIndex = food.indexOf(targetItem);
                      setState(() {
                        food[targetIndex] =
                            food[targetIndex].copyWith(isFavorite: false);
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.primary,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
