import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/root.dart';
import 'package:food_delivery/services/itemDetails/presentation/screens/item_details_screen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak-Delivery App',
      theme: ThemeData(
          fontFamily: "OpenSans",
          scaffoldBackgroundColor: AppColors.lightBackground,
          useMaterial3: true,
          colorSchemeSeed: Colors.deepOrange,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: AppColors.lightBackground,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white))),
      routes: {
        '/': (context) => const Root(),
        ItemDetailsScreen.routeName: (context) => const ItemDetailsScreen(),
      },
    );
  }
}
