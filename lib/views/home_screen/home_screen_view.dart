import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:royal_spa_garden_mobile/model/list_mission_model.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/utils/size_utils.dart';
import 'package:royal_spa_garden_mobile/views/home_screen/cubit/home_screen_cubit.dart';
import 'package:royal_spa_garden_mobile/widget/mission_card_widget.dart';

import '../../widget/botton_icon_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => Container(),
              loaded: (data, mission) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      _dialogBuilder(
                        context,
                        jsonEncode(data.data.user.toJson()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.qr_code,
                      color: Colors.green,
                    ),
                  ),
                );
              });
        },
      ),
      body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (data, mission) => _loaded(context, data, mission),
            error: (message) => Center(child: Text(message ?? 'Error')),
            unauthorized: () => const Center(child: Text('Unauthorized')),
          );
        },
      ),
    );
  }

  Widget _loaded(
      BuildContext context, ProfileModel data, ListMissionModel mission) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeScreenCubit>().initial();
      },
      child: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/banner.png',
                width: double.infinity,
                height: SizeUtils.getHeight(context) * 0.28,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: SizeUtils.getHeight(context) * 0.32),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/hisotry_point');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: SizeUtils.getWidth(context) * 0.9,
                      height: SizeUtils.getHeight(context) * 0.08,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hi, ${data.data.user.name}"),
                          Text("${data.data.point.points} Points")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: SizeUtils.getHeight(context) * 0.02),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: SizeUtils.getWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BottonIconWidget(
                              title: "Services",
                              icon: Icons.category_rounded,
                              onTap: () {
                                Navigator.pushNamed(context, '/services');
                              },
                            ),
                            BottonIconWidget(
                              title: "Leader Board",
                              icon: Icons.leaderboard_rounded,
                              onTap: () {
                                Navigator.pushNamed(context, '/leaderboard');
                              },
                            ),
                            BottonIconWidget(
                              title: "History",
                              icon: Icons.history_rounded,
                              onTap: () {
                                Navigator.pushNamed(context, '/history');
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BottonIconWidget(
                              title: "Rewards",
                              icon: Icons.redeem_rounded,
                              onTap: () {
                                Navigator.pushNamed(context, '/reward');
                              },
                            ),
                            BottonIconWidget(
                              title: "Voucher",
                              icon: Icons.discount_rounded,
                              onTap: () {
                                Navigator.pushNamed(context, '/voucher_shop');
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Upcoming Events",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: mission.data.map((data) {
                      return MissionCardWidget(
                        title: data.mission.title,
                        description: data.mission.description,
                        points: data.mission.points,
                        goal: data.mission.goal,
                        progress: data.progress,
                        status: data.status,
                        tapCallback: () {
                          Navigator.pushNamed(
                            context,
                            '/mission_detail',
                            arguments: data.mission,
                          );
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String data) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('QR Code User'),
          content: PrettyQrView.data(
            data: data,
          ),
        );
      },
    );
  }
}
