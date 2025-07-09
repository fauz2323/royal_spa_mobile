import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royal_spa_garden_mobile/utils/route_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Royal Spa Garden',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Hanken',
        scaffoldBackgroundColor: const Color(0xfff8f8f8),
      ),
      routes: RouteUtils.routes,
      initialRoute: '/login',
    );
  }
}
