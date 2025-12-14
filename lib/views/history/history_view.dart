import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/model/history_model.dart';
import 'package:royal_spa_garden_mobile/views/history/cubit/history_cubit.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<HistoryCubit, HistoryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loaded: (data) => _loaded(context, data),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Center(
                child: Text('Error: $message'),
              ),
            );
          },
        ));
  }

  Widget _loaded(BuildContext context, HistoryModel data) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: data.data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.data[index].spaService.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Date Orders: ${data.data[index].createdAt}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    data.data[index].spaService.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rp. ${data.data[index].spaService.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add detail functionality here\
                      Navigator.pushNamed(
                        context,
                        '/detail_order',
                        arguments: data.data[index].id.toString(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Detail'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
