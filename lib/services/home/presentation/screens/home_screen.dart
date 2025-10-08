import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/services/home/data/models/food_item.dart';
import 'package:food_delivery/services/home/presentation/widgets/grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                "assets/images/home/classic_burger.jpg",
                height: size.height * 0.26,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            GridView.builder(
              itemCount: food.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                
                return GridItem(itemIndex: index);
              },
            )
          ],
        ),
      ),
    );
  }
}
