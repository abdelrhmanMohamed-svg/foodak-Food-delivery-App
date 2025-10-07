import 'package:flutter/material.dart';
import 'package:food_delivery/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak-Delivery App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Root(),
    );
  }
}
