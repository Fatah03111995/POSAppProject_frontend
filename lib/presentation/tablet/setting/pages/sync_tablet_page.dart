import 'package:flutter/material.dart';
import 'package:flutter_pos_app/core/components/spaces.dart';
import 'package:flutter_pos_app/core/constants/colors.dart';

class SyncTabletPage extends StatelessWidget {
  const SyncTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: AppColors.primary,
                  content: Text(
                    'Sync data product success',
                  )));
            },
            child: const Text('Sync Data Product')),
        const SpaceHeight(20),
        //button sync data order
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: AppColors.primary,
                  content: Text(
                    'Sync data orders success',
                  )));
            },
            child: const Text('Sync Data Orders')),
        const SpaceHeight(20),
        //button sync categories
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: AppColors.primary,
                  content: Text(
                    'Sync data categories success',
                  )));
            },
            child: const Text('Sync Data Categories')),
      ],
    );
  }
}
