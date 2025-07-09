import 'package:flutter/material.dart';
import 'package:royal_spa_garden_mobile/views/home/home_view.dart';
import 'package:royal_spa_garden_mobile/views/login/login_view.dart';
import 'package:royal_spa_garden_mobile/views/profile/profile_view.dart';
import 'package:royal_spa_garden_mobile/views/register/register_view.dart';

class RouteUtils {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/login': (context) => const LoginView(),
    '/register': (context) => const RegisterView(),
    '/home': (context) => const HomeView(),
    '/profile': (context) => const ProfileView(),
  };
}
