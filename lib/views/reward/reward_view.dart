import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:royal_spa_garden_mobile/model/reward_list_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';
import 'package:royal_spa_garden_mobile/views/reward/cubit/reward_cubit.dart';
import 'package:royal_spa_garden_mobile/widget/voucher_card.dart';

class RewardView extends StatelessWidget {
  const RewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RewardCubit()..initial(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rewards')),
      body: BlocConsumer<RewardCubit, RewardState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              unauthorized: () async {
                await TokenUtils.deleteAllTokens();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (route) => false);
                // Handle unauthorized state, e.g., navigate to login
              });
        },
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(child: CircularProgressIndicator());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (data) => Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: _loaded(context, data),
            ),
            error: (message) => Center(child: Text('Error: $message')),
            unauthorized: () => const Center(child: Text('Unauthorized')),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, RewardListModel data) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<RewardCubit>().initial();
      },
      child: ListView.builder(
        itemCount: data.data.length,
        itemBuilder: (context, index) {
          final reward = data.data[index];
          return VoucherCard(
            name: reward.voucher.name,
            discount: reward.voucher.discountAmount,
            voucherId: reward.voucher.id.toString(),
            expiryDate: reward.voucher.expiryDate.toString(),
            status: reward.status,
            onTap: () {
              if (reward.status == "unused") {
                _dialogBuilder(context, jsonEncode(reward.toJson()));
              }
            },
          );
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, String data) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tunjukkan pada Admin untuk memakai Voucher'),
          content: PrettyQrView.data(
            data: data,
          ),
        );
      },
    );
  }
}
