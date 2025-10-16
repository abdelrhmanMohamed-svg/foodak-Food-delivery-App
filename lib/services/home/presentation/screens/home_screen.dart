import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/core/ui_models/item_details_args.dart';
import 'package:food_delivery/services/home/data/models/category_item.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/home/presentation/widgets/grid_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/screens/item_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<FoodItem> filterdList;
  String? selectedID;
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    filterdList = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                "assets/images/home/classic_burger.jpg",
                height: isLandScape ? size.height * 0.5 : size.height * 0.26,
                width: isLandScape ? size.width * 0.8 : size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) {
                    final category = categories[index];

                    return Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedID == category.id || !isSelected) {
                              isSelected = !isSelected;
                            }
                            if (isSelected) {
                              selectedID = category.id;
                              filterdList = food
                                  .where(
                                    (item) => item.categoryId == category.id,
                                  )
                                  .toList();
                            } else {
                              selectedID = null;
                              filterdList = food;
                            }
                          });
                        },
                        child: Container(
                          height: size.height * 0.12,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: selectedID == category.id
                                ? AppColors.primary
                                : AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  category.imgUrl,
                                  height: size.height * 0.05,
                                ),
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  category.name,
                                  style: selectedID == category.id
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(color: AppColors.white)
                                      : Theme.of(context).textTheme.titleLarge,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            GridView.builder(
              itemCount: filterdList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandScape ? 4 : 2,
                mainAxisSpacing:
                    isLandScape ? size.height * 0.05 : size.height * 0.015,
                crossAxisSpacing: size.width * 0.02,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      final targetedItem = food.firstWhere(
                        (item) => item.id == filterdList[index].id,
                      );
                      final targetIndex = food.indexOf(targetedItem);
                      Navigator.of(context)
                          .pushNamed(ItemDetailsScreen.routeName,
                              arguments:
                                  ItemDetailsArgs(itemIndex: targetIndex))
                          .then((value) => setState(() {
                                filterdList = food;
                                selectedID = null;
                              }));
                    },
                    child: GridItem(
                      item: filterdList[index],
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
