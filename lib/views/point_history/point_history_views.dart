import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';
import 'package:royal_spa_garden_mobile/views/point_history/cubit/point_history_cubit.dart';

class PointHistoryViews extends StatelessWidget {
  const PointHistoryViews({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PointHistoryCubit()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point History'),
      ),
      body: BlocConsumer<PointHistoryCubit, PointHistoryState>(
        listener: (context, state) {
          // You can handle side effects here based on state changes
          state.mapOrNull(
            unauthorized: (_) async {
              await TokenUtils.deleteAllTokens();
              // For example, navigate to login if unauthorized
              Navigator.pushReplacementNamed(context, '/login');
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (data) {
              return ListView.builder(
                itemCount: data.data.length,
                itemBuilder: (context, index) {
                  final historyItem = data.data[index];
                  return ListTile(
                    title: Text(historyItem.description),
                    subtitle: Text('Points: ${historyItem.points}'),
                    trailing: Text(historyItem.createdAt.toString()),
                  );
                },
              );
            },
            error: () => const Center(child: Text('An error occurred')),
            unauthorized: () => const Center(child: Text('Unauthorized')),
          );
        },
      ),
    );
  }
}
