import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/views/mission/cubit/detail_mission_cubit.dart';

import '../../arguments/service_detail_argument.dart';
import '../../model/list_mission_model.dart';
import '../../model/service_spa_model.dart';
import 'cubit/detail_mission_state.dart';

class DetailMissionView extends StatefulWidget {
  const DetailMissionView({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DetailMissionViewState();
}

class _DetailMissionViewState extends State<DetailMissionView> {
  Mission? _mission;

  Mission get mission => _mission!;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_mission == null) {
      _mission ??= ModalRoute.of(context)!.settings.arguments as Mission;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailMissionCubit(mission)..loadServices(), // Auto-fetch on init
      child: BlocBuilder<DetailMissionCubit, DetailMissionState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Mission Detail',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.green,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(DetailMissionState state) {
    return state.when(
      initial: () {
        return const Center(child: CircularProgressIndicator());
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (mission, serviceList) => Container(
        margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MissionInfo(mission: mission),
              const SizedBox(height: 24),
              const Text('Services to Complete Mission:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...serviceList.map(
                (service) => _ServiceCard(
                  service: service,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/service_detail',
                      arguments: ServiceDetailArgument(service.uuid),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      error: (message) => Center(child: Text('Error: $message')),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  _ServiceCard({required this.service, required this.onTap});

  final SpaService service;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                service.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        service.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Rp. ${service.price}",
                        style: const TextStyle(
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

class _MissionInfo extends StatelessWidget {
  final Mission mission;

  const _MissionInfo({required this.mission});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mission.title,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(mission.description),
            const SizedBox(height: 16),
            Text('Points: ${mission.points} pts'),
            const SizedBox(height: 16),
            Row(
              children: [
                Text('Goal: ${mission.goal}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('Expires At: ${mission.expiredDate}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
