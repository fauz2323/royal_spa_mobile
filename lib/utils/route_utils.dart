import 'package:flutter/material.dart';
import 'package:royal_spa_garden_mobile/views/about/about_view.dart';
import 'package:royal_spa_garden_mobile/views/booking_page/booking_page_view.dart';
import 'package:royal_spa_garden_mobile/views/detail_order/detail_order_view.dart';
import 'package:royal_spa_garden_mobile/views/edit_profile/edit_profile_view.dart';
import 'package:royal_spa_garden_mobile/views/forgot_password/forgot_password_view.dart';
import 'package:royal_spa_garden_mobile/views/history/history_view.dart';
import 'package:royal_spa_garden_mobile/views/home/home_view.dart';
import 'package:royal_spa_garden_mobile/views/leaderboard/leaderboard_view.dart';
import 'package:royal_spa_garden_mobile/views/login/login_view.dart';
import 'package:royal_spa_garden_mobile/views/profile/profile_view.dart';
import 'package:royal_spa_garden_mobile/views/qna/qna_view.dart';
import 'package:royal_spa_garden_mobile/views/register/register_view.dart';
import 'package:royal_spa_garden_mobile/views/service/service_view.dart';
import 'package:royal_spa_garden_mobile/views/service_detail/service_detail_view.dart';
import 'package:royal_spa_garden_mobile/views/splash/splash_view.dart';
import 'package:royal_spa_garden_mobile/views/voucher_shop/voucher_shop_view.dart';

class RouteUtils {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/splash': (context) => const SplashView(),
    '/login': (context) => const LoginView(),
    '/register': (context) => const RegisterView(),
    '/forgot_password': (context) => const ForgotPasswordView(),
    '/home': (context) => const HomeView(),
    '/profile': (context) => const ProfileView(),
    '/services': (context) => const ServiceView(),
    '/service_detail': (context) => ServiceDetailView(),
    '/about': (context) => const AboutView(),
    '/edit_profile': (context) => const EditProfileView(),
    '/qna': (context) => const QnaView(),
    '/history': (context) => const HistoryView(),
    '/leaderboard': (context) => const LeaderboardView(),
    '/booking_page': (context) => const BookingPageView(),
    '/detail_order': (context) => const DetailOrderView(),
    '/voucher_shop': (context) => const VoucherShopView(),
  };
}
