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
                    border: Border.all(color: Colors.green, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                          const BottonIconWidget(
                            title: "Leader Board",
                            icon: Icons.leaderboard_rounded,
                          ),
                          const BottonIconWidget(
                            title: "History",
                            icon: Icons.history_rounded,
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Row(
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
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Upcoming Events",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
