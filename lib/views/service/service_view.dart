import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/arguments/service_detail_argument.dart';
import 'package:royal_spa_garden_mobile/model/service_spa_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';
import 'package:royal_spa_garden_mobile/views/service/cubit/services_cubit.dart';

import '../../widget/service_card_widget.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit()..fetchServices(),
      child: Builder(builder: (context) {
        return _build(context);
      }),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<ServicesCubit, ServicesState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthorized: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Unauthorized access. Please log in."),
                ),
              );

              await TokenUtils.deleteAllTokens();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (Route<dynamic> route) => false,
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              loaded: (data) => _loaded(context, data),
              error: (message) => Center(
                    child: Text("Error: $message"),
                  ),
              unauthorized: () => const Center(
                    child: Text("Unauthorized. Please log in."),
                  ));
        },
      )),
    );
  }

  Widget _loaded(BuildContext context, ServiceSpaModel data) {
    return Column(
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
            children: data.data
                .map((element) => ServiceCardWidget(
                      title: element.name,
                      price: element.price.toString(),
                      imageUrl: element.image,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/service_detail',
                          arguments: ServiceDetailArgument(element.uuid),
                        );
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
// ServiceCardWidget(),
