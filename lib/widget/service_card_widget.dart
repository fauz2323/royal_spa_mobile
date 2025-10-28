import 'package:flutter/material.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card tap if needed
        Navigator.pushNamed(context, '/service_detail');
      },
      child: Container(
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green.withValues(
              alpha: 0.1,
            )),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/spa.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Spa Service Spa Service Spa Service Spa Service Spa Service Spa Service 222",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Rp. 100.000",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
