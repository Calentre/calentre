import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

Future<String?> addPaymentModal(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: AppColors.grey.s900,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: AppColors.grey.s700, width: 1)),
      title: const Text('AlertDialog Title'),
      content:
          Container(width: 400, child: const Text('AlertDialog description')),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
