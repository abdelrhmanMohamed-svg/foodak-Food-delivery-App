import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key});

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: AppColors.white),
      child: Row(
        children: [
          IconButton(
            onPressed: decrementCounter,
            icon: Icon(
              Icons.remove,
              size: isLandScape ? size.height * 0.08 : size.height * 0.033,
              color: counter <= 1
                  ? AppColors.inactiveCounter
                  : AppColors.activeCounter,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: incrementCounter,
            icon: Icon(Icons.add,
                size: isLandScape ? size.height * 0.08 : size.height * 0.033),
          ),
        ],
      ),
    );
  }
}
