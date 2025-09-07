import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_pos_app/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_app/core/extensions/int_ext.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../../data/dataoutputs/cwb_print.dart';

class PaymentQrisDialog extends StatefulWidget {
  final bool isTablet;
  final int price;
  const PaymentQrisDialog({
    Key? key,
    required this.price,
    this.isTablet = false,
  }) : super(key: key);

  @override
  State<PaymentQrisDialog> createState() => _PaymentQrisDialogState();
}

class _PaymentQrisDialogState extends State<PaymentQrisDialog> {
  String orderId = '';
  Timer? timer;

  WidgetsToImageController controller = WidgetsToImageController();

  @override
  void initState() {
    orderId = DateTime.now().millisecondsSinceEpoch.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.primary,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pembayaran QRIS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SpaceHeight(6.0),
          Container(
            width: context.deviceWidth,
            padding: const EdgeInsets.all(14.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WidgetsToImage(
                  controller: controller,
                  child: Container(
                    width: 256.0,
                    height: 256.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Image.network(
                        'https://qris.id/api-doc/assets/img/MPM_QRIS_Dasar.jpg',
                      ),
                    ),
                  ),
                ),
                const SpaceHeight(5.0),
                const Text(
                  'Scan QRIS untuk melakukan pembayaran',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SpaceHeight(16),
                Text(
                  'Price: ${100000.currencyFormatRp}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SpaceHeight(16),
                ElevatedButton(
                  onPressed: () async {
                    final bytes = await controller.capture();
                    final listInt =
                        await CwbPrint.instance.printQRIS(100000, bytes!);
                    CwbPrint.instance.printReceipt(listInt);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Print QRIS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
