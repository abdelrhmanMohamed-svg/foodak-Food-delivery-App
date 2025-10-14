import 'package:flutter/material.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/home/presentation/widgets/grid_item.dart';
import 'package:food_delivery/services/itemDetails/presentation/screens/item_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            GridView.builder(
              itemCount: food.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandScape ? 4 : 2,
                mainAxisSpacing:
                    isLandScape ? size.height * 0.05 : size.height * 0.015,
                crossAxisSpacing: size.width * 0.02,
              ),
              itemBuilder: (context, index) {
                return  GridItem(itemIndex: index);
              },
            )
          ],
        ),
      ),
    );
  }
}
