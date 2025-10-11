import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final userName = Text(
      "Abdelrahman Mohamed",
      style: Theme.of(context).textTheme.headlineLarge,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          if (isLandScape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    children: [
                      personAvatar(size.height * 0.2),
                      SizedBox(height: size.height * 0.03),
                      userName,
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
                Column(
                  children: [
                    customColumn(context, title: "Orders", value: 50),
                    SizedBox(height: size.height * 0.05),
                    customColumn(context, title: "Vouchers", value: 20),
                  ],
                )
              ],
            )
          ],
          if (!isLandScape) ...[
            SizedBox(height: size.height * 0.04),
            personAvatar(size.height * 0.13),
            SizedBox(height: size.height * 0.03),
            userName,
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customColumn(context, title: "Orders", value: 50),
                customColumn(context, title: "Vouchers", value: 20),
              ],
            ),
          ],
          SizedBox(height: size.height * 0.02),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          customListTile(context,
              leading: Icons.shopping_cart_outlined,
              title: "My Orders",
              trailing: Icons.arrow_forward_ios),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          customListTile(context,
              leading: Icons.shopping_cart_outlined,
              title: "Avaliable Vouchers",
              trailing: Icons.arrow_forward_ios),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
        ],
      ),
    );
  }

  CircleAvatar personAvatar(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage:
          AssetImage("assets/images/profile/profile_icon_placholder.png"),
    );
  }

  Column customColumn(BuildContext context,
      {required String title, required double value}) {
    return Column(
      children: [
        Text(value.toString(),
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 5),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColors.primary)),
      ],
    );
  }

  ListTile customListTile(BuildContext context,
      {required IconData leading, required String title, IconData? trailing}) {
    return ListTile(
      leading: Icon(
        leading,
        color: AppColors.primary,
        size: 30,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing:
          trailing != null ? Icon(trailing, color: AppColors.primary) : null,
    );
  }
}
