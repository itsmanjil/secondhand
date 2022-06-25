import 'package:secondhand/screen/add_product.dart';
import 'package:secondhand/screen/bottom_screen/category.dart';
import 'package:secondhand/screen/bottom_screen/home.dart';
import 'package:secondhand/screen/bottom_screen/profile.dart';
import 'package:secondhand/screen/dashboard.dart';
import 'package:secondhand/screen/login.dart';
import 'package:secondhand/screen/register.dart';
import 'package:secondhand/screen/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const MyLogin(),
        '/register': (context) => const MyRegister(),
        '/dashboard': (context) => const DashboardScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/cart': (context) => const Categories(),
        '/addProduct': (context) => const AddProductScreen(),
      },
    ),
  );
}
