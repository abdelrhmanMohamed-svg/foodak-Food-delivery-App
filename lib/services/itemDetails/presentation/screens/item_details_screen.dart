import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/widgets/item_counter.dart';
import 'package:food_delivery/services/itemDetails/presentation/widgets/item_description.dart';
import 'package:food_delivery/services/itemDetails/presentation/widgets/item_property.dart';
import 'package:food_delivery/services/itemDetails/presentation/widgets/top_banner.dart';
import 'package:food_delivery/shared/custom_back_button.dart';
import 'package:food_delivery/shared/fav_button.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.itemIndex});
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: size.height * 0.5,
                    pinned: true,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8.0),
                      child: CustomBackButton(iconSize: size.height * 0.035),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.network(
                          food[itemIndex].imgUrl,
                          height: size.height * 0.46,
                          width: size.width * 0.9,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8.0),
                        child: FavButton(
                            itemIndex: itemIndex,
                            iconSize: size.height * 0.035),
                      ),
                    ],
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, top: 10.0, bottom: 25.0),
                      child: Column(
                        children: [
                          ItemDescription(itemIndex: itemIndex),
                          SizedBox(height: size.height * 0.042),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ItemProperty(
                                    propertyName: "Size", value: "Medium"),
                                const VerticalDivider(
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                ItemProperty(
                                    propertyName: "Calories",
                                    value: "150 Kcal"),
                                const VerticalDivider(
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                ItemProperty(
                                    propertyName: "Cooking",
                                    value: "10-20 Min"),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.042),
                          Text(
                              "Occaecat mollit adipisicing aliquip in incididunt do commodo sit elit. Enim magna officia esse fugiat mollit. Qui id incididunt qui esse exercitation exercitation reprehenderit. Velit nisi eu incididunt ea et. Sit occaecat ea cillum et quis labore mollit officia elit duis. Consectetur nostrud voluptate consectetur enim excepteur ut anim occaecat consequat Lorem Lorem anim aliqua minim."),
                          SizedBox(
                            height: 600,
                          ),
                        ],
                      ),
                    )
                  ]))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
              child: Row(
                mainAxisAlignment: isLandScape
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${food[itemIndex].price}",
                    style: isLandScape
                        ? Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColors.primary)
                        : Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: AppColors.primary),
                  ),
                  SizedBox(
                      width: isLandScape ? size.width * 0.3 : size.width * 0.6,
                      height: isLandScape
                          ? size.height * 0.15
                          : size.height * 0.058,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "check out",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
