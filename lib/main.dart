import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/core/theme/app_colors.dart';
import 'package:food_delivery/root.dart';

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
          )),
      home: const Root(),
    );
  }
}
