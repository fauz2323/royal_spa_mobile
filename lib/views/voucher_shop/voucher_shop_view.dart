import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_spa_garden_mobile/model/profile_model.dart';
import 'package:royal_spa_garden_mobile/model/voucher_list_model.dart';
import 'package:royal_spa_garden_mobile/utils/token_utils.dart';
import 'package:royal_spa_garden_mobile/views/voucher_shop/cubit/voucher_shop_cubit.dart';
import 'package:royal_spa_garden_mobile/widget/voucher_card.dart';

class VoucherShopView extends StatefulWidget {
  const VoucherShopView({super.key});

  @override
  State<VoucherShopView> createState() => _VoucherShopViewState();
}

class _VoucherShopViewState extends State<VoucherShopView> {
  // Data dummy dari JSON

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoucherShopCubit()..initial(),
      child: Builder(
        builder: (context) {
          return _build(context);
        },
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Tukar Poin'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocConsumer<VoucherShopCubit, VoucherShopState>(
          listener: (context, state) {
            state.whenOrNull(
              unauthorized: () async {
                await TokenUtils.deleteAllTokens();
                // Handle unauthorized state, e.g., navigate to login
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Sesi Anda telah berakhir. Silakan masuk kembali.'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Center(
                  child: Text('Terjadi kesalahan tak terduga.'),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (message) {
                return Center(
                  child: Text('Error: $message'),
                );
              },
              loaded: (data, profile) {
                return _loaded(context, data, profile);
              },
              success: (message) {
                return _success(context, message);
              },
            );
          },
        ));
  }

  Widget _loaded(
      BuildContext context, VoucherShopListModel data, ProfileModel profile) {
    return Column(
      children: [
        // Header Card - Poin saya
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green[300]!, Colors.green[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Poin Saya',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                profile.data.point.points.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Poin',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),

        // List Vouchers
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              final voucher = data.data[index];
              return _buildVoucherCard(voucher, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVoucherCard(Datum voucher, BuildContext context) {
    final points = int.parse(voucher.price);
    final discount = voucher.discountAmount;
    final expiryDate = voucher.expiryDate;
    final name = voucher.name;
    return VoucherCard(
      name: name,
      discount: discount,
      points: points.toString(),
      voucherId: voucher.id.toString(),
      expiryDate: expiryDate.toString(),
      status: "",
      onTap: () {
        _showRedeemDialog(name, points, voucher.id.toString(), context);
      },
    );
  }

  Widget _success(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  void _showRedeemDialog(String voucherName, int points, String voucherId,
      BuildContext parentContext) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Penukaran'),
          content: Text(
              'Apakah Anda yakin ingin menukar $points poin untuk voucher "$voucherName"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Tutup dialog
                await parentContext
                    .read<VoucherShopCubit>()
                    .redeemVoucher(voucherId);
              },
              child: const Text('Tukar'),
            ),
          ],
        );
      },
    );
  }
}
