import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/views/history/history_view.dart';
import 'package:royal_spa_garden_mobile/views/home/cubit/home_cubit.dart';
import 'package:royal_spa_garden_mobile/views/home_screen/home_screen_view.dart';
import 'package:royal_spa_garden_mobile/views/profile/profile_view.dart';
import 'package:royal_spa_garden_mobile/views/service/service_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Widget> _fragment = <Widget>[
    const HomeScreenView(),
    const ServiceView(),
    const HistoryView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  // Build
  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Placeholder(),
              initial: (index) => _fragment.elementAt(index),
            );
          },
        ),
      ),
      // Botton Navbar
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Text('Some error'),
            initial: (index) => NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon:
                      Icon(Icons.home, color: Color.fromRGBO(217, 217, 217, 1)),
                  label: 'Home',
                  selectedIcon: Icon(
                    Icons.home,
                    color: Color(0xff754E1A),
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.category_rounded,
                      color: Color.fromRGBO(217, 217, 217, 1)),
                  label: 'Service',
                  selectedIcon: Icon(
                    Icons.category_rounded,
                    color: Color(0xff754E1A),
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.history_rounded,
                      color: Color.fromRGBO(217, 217, 217, 1)),
                  label: 'History',
                  selectedIcon: Icon(
                    Icons.history_rounded,
                    color: Color(0xff754E1A),
                  ),
                ),
                NavigationDestination(
                  icon: Icon(Icons.account_circle,
                      color: Color.fromRGBO(217, 217, 217, 1)),
                  label: 'Profile',
                  selectedIcon: Icon(
                    Icons.account_circle,
                    color: Color(0xff754E1A),
                  ),
                ),
              ],
              selectedIndex: index,
              indicatorColor: Colors.transparent,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
              onDestinationSelected: (index) {
                context.read<HomeCubit>().setSelected(index);
              },
            ),
          );
        },
      ),
    );
  }
}
