import 'package:flutter/material.dart';
import 'package:flutter_task/constant/colors.dart';
import 'package:flutter_task/views/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          centerTitle: true,
          iconTheme: IconThemeData(color: whiteColor),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
