import 'package:flutter/material.dart';

import '../../widget/service_card_widget.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Spa Service",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: const [
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                  ServiceCardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
