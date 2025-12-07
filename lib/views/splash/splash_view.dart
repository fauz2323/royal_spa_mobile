import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/views/splash/cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..initial(),
      child: Builder(
        builder: (BuildContext context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            state.maybeWhen(
              authenticated: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              unauthenticated: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
