import 'package:flutter/material.dart';
import 'package:royal_spa_garden_mobile/utils/size_utils.dart';

import '../../widget/botton_icon_widget.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'assets/images/banner.png',
              width: double.infinity,
              height: SizeUtils.getHeight(context) * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: SizeUtils.getHeight(context) * 0.32),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: SizeUtils.getWidth(context) * 0.9,
                  height: SizeUtils.getHeight(context) * 0.08,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(102, 137, 131, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Hi, User A"), Text("0 Points")],
                  ),
                ),
                SizedBox(height: SizeUtils.getHeight(context) * 0.02),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: SizeUtils.getWidth(context) * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(102, 137, 131, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottonIconWidget(
                            title: "Services",
                            icon: Icons.category_rounded,
                          ),
                          BottonIconWidget(
                            title: "Leader Board",
                            icon: Icons.leaderboard_rounded,
                          ),
                          BottonIconWidget(
                            title: "History",
                            icon: Icons.history_rounded,
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottonIconWidget(
                            title: "Rewards",
                            icon: Icons.redeem_rounded,
                          ),
                          BottonIconWidget(
                            title: "Voucher",
                            icon: Icons.discount_rounded,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
