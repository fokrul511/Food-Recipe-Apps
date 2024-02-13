import 'package:flutter/material.dart';
import 'package:food_recipe/views/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipe',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 3,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
